"""
    uxid/uxid
    ~~~~~~~~~

    Object representation of a UXID.
"""

__all__ = ['UXID']


class UXID(object):
    __slots__ = ['encoded']

    def __init__(self, encoded):
        self.encoded = encoded
