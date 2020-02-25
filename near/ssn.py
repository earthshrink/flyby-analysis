#!/usr/bin/env python

import numpy

class Dist:
    """Distribution on graph"""

    total_points = 105
    altair_count = 39
    millstone_count = total_points - altair_count

    def stat(self):
        dist_std = self.dist.std()
        dist_mean = self.dist.mean()
        dist_mean_square = numpy.square(self.dist).sum() / self.dist.size
        dist_root_mean_square = numpy.sqrt(dist_mean_square)

        print("{}:".format(self.__class__.__name__))
        print("\tN = {}".format(self.dist.size))
        print("\tS = {}".format(dist_std))
        print("\tM = {}".format(dist_mean))
        print("\tR = {}".format(dist_root_mean_square))
        print("\tS' = {}".format(dist_root_mean_square/self.precision))


class Millstone(Dist):
    """Distribution of Millstone"""

    precision = 5
    usable_max = -505
    usable_min = -730
    usable_20 = -605
    outliers = 6

    def __init__(self):
        usable = self.millstone_count - self.outliers
        first20 = numpy.linspace(self.usable_min, self.usable_20, 20)
        rest = numpy.linspace(self.usable_20, self.usable_max, usable - 20)
        self.dist = numpy.concatenate((first20, rest))
        self.stat()


class Altair(Dist):
    """Distribution of ALTAIR"""

    precision = 25

    def __init__(self):
        self.dist = numpy.array([
            -929, -929, -908, -894, -881, -867, -853, -847, -832, -818, -825, -805, -804,
            -779, -717, -695, -666, -671, -658, -614, -598, -597, -588, -575, -567, -553,
            -556, -544, -533, -520, -512, -501, -482, -467, -472, -450, -446, -444, -454,
            ])
        self.stat()


if __name__ == "__main__":
    Millstone()
    Altair()

# end
