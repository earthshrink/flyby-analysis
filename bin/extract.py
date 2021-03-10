#!/usr/bin/env python
"""Batch processor for JPL/Horizons CGI response"""

from io import StringIO
import sys
import re
import pandas as pd


class Processor:
    """Batch query processor for JPL/Horizons CGI interface

    Example:
        query = Query()
        #data = query.load('response.txt')
        data = query.fetch('query.q')
        print(data.head())

        Where:
            'response.txt' contains the response captured, say using 'curl'
            'query.q' contains the key-value parameter pairs, in the format
            returned by JPL/Horizons server at the end of the response

    Processing:
        - a fixed set of values are requested for consistency of the anlysis
        - JPL/Horizons gives range and range rate in km, we convert to metres
        - JPL/Horizons gives one-way light times in minutes, convert to seconds
        - we calculate acceleration, doppler rate and the range and velocity
          lags as described in the EPL 2015 paper
    """

    _re_data = ''

    def __init__(self):
        self._re_data = re.compile(r'\$\$SOE.*\$\$EOE', re.DOTALL)
        self._re_angles = re.compile(r'\s*([+-]?\d{2}).(\d{2}).(\d{2}\.\d+)')
        self._speed = 299792458

    def parse(self, response):
        """Parse the response from the JPL/Horizons server"""

        match_result = self._re_data.search(response)
        data = pd.read_csv(StringIO(match_result.group()[6:match_result.end()
                                                         -match_result.start()-6]),
                           names=['timestamp', 'azi/ra', 'el/dec',
                                  'lighttime', 'range', 'velocity'],
                           usecols=[0, 3, 4, 5, 6, 7],
                           index_col=0,
                           parse_dates=[0])
        return data


    def hms(self, sh, sm, ss):
        return float(sh) + float(sm)/60.0 + float(ss)/3600


    def normalize_angle(self, datum):
        m = self._re_angles.match(datum)
        if m:
            return self.hms(m.group(1), m.group(2), m.group(3))
        return datum


    def normalize(self, data):
        """Normalize data returned by the JPL/Horizons server"""

        data['dt'] = data.index.to_series().diff().dt.seconds \
                     + data.index.to_series().diff().dt.microseconds.div(1000000, fill_value=0)

        data['range'] *= 1000 # from km
        data['velocity'] *= 1000 # from km
        data['lighttime'] = data['lighttime'] * 60.0 # from minutes(!)

        data['acceleration'] = data['velocity'].diff()/data['dt']
        data['traveltime'] = data['range'] / self._speed  # should match the one-way lighttimes

        data['rangelag'] = data['velocity'] * data['traveltime']
        data['velocitylag'] = data['acceleration'] * data['traveltime']

        data['ratedoppler'] = data['acceleration'] / data['velocity']

        if isinstance(data['el/dec'], str):
            data['el/dec'] = data['el/dec'].map(lambda a: self.normalize_angle(a))

        return data

    def load(self, dname):
        """Load server response data file for processing"""

        with open(dname) if len(dname) > 1 else sys.stdin as dfile:
            resp = dfile.read()
        output = StringIO()
        self.normalize(self.parse(resp)).to_csv(output, sep='\t')
        output.seek(0)
        return output.read()


if __name__ == "__main__":
    print(Processor().load(sys.argv[1] if len(sys.argv) > 1 else ''))

# end
