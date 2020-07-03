"""
    uxid/uxid
    ~~~~~~~~~

    Object representation of a UXID.
"""
import math

__all__ = ['UXID']

CROCKFORD_ENCODING = '0123456789ABCDEFGHJKMNPQRSTVWXYZ'
TIME_LEN = 10

class UXID(object):
    __slots__ = ['encoded', 'time']

    def __init__(self, encoded):
        self.encoded = encoded
        self.decode_time()

    def decode_time(self):
        decoded_time = 0
        time_chars = self.encoded[0:TIME_LEN][::-1]

        for power_index in range(TIME_LEN):
            char = time_chars[power_index]
            power_value = math.pow(32, power_index)
            alphabet_index = CROCKFORD_ENCODING.index(char)
            decoded_time += power_value * alphabet_index

        self.time = decoded_time
