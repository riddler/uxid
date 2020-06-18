"""
    uxid
    ~~~~

    User Experience focused Identifier

    :copyright: (c) 2020 JohnnyT.
    :license: MIT, see LICENSE for more details
"""
from . import api, uxid

decode = api.decode

UXID = uxid.UXID

__all__ = api.__all__ + uxid.__all__
