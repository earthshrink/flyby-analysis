#!/usr/bin/env python
"""Batch query for JPL/Horizons CGI"""

import re
import sys
import requests

class QueryError(Exception):
    """Base class for query exceptions"""

    def __init__(self, message):
        super().__init__(message)
        self.message = message


class Query:
    """Batch query for JPL/Horizons CGI interface

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

    _re_spaces = ''
    _url = ''
    _pfx = ''

    def __init__(self):
        self._re_spaces = re.compile(r' *= *')
        self._url = 'https://ssd.jpl.nasa.gov/horizons_batch.cgi'
        self._pfx = 'batch=1'
        self._speed = 299792458

    def encode(self, string):
        """Encode parameter string for CGI GET"""

        string = self._re_spaces.sub(r'=', string)
        string = string.replace(r' ', '%20')
        string = string.replace(r';', '%3b')
        string = string.replace(r'&', '%26')
        string = string.replace(r'?', '%3f')
        return string

    def compose(self, fname):
        """Compile CGI GET parameters"""

        with open(fname) if len(fname) > 1 else sys.stdin as pfile:
            query = [self.encode(line.strip()) if '$$' not in line else ''
                     for line in pfile]
        return '&'.join(query)

    def fetch(self, qfname):
        """Fetch data from the JPL/Horizons server, using query parameters from file"""

        query = self.compose(qfname)
        req = requests.get(self._url, params=self._pfx + query)

        if req.status_code != 200:
            raise QueryError("Unexpected response")

        if "Cannot" in req.text:
            issue = ''.join([s if "Cannot" in s else '' for s in req.text.splitlines()])
            raise QueryError("Query failed: {}".format(issue))

        return req.text


if __name__ == "__main__":
    print(Query().fetch(sys.argv[1] if len(sys.argv) > 1 else ''))

# end
