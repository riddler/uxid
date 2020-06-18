"""
    uxid/api
    ~~~~~~~~

    Public API of the UXID package.
"""
import re

from . import uxid

__all__ = ['decode']

CROCKFORD_ENCODING = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"
INVALID_REGEX = re.compile("[^%s]" % CROCKFORD_ENCODING)


def decode(string):
    if isinstance(string, str):
        len_value = len(string)

        if len_value == 0:
            raise ValueError('input is required')
        if INVALID_REGEX.match(string):
            raise ValueError('expected input to be a Base32 encoded string, got: \'%s\'' % string)

        return uxid.UXID(string)
