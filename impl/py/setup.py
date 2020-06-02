#!/usr/bin/env python
from setuptools import setup, find_packages

with open("README.md", "r") as fh:
    long_description = fh.read()

setup(
    name="uxid",
    version="0.0.1",
    author="JohnnyT <ubergeek3141@gmail.com>",
    author_email="ubergeek3141@gmail.com",
    description="User Experience focused Identifiers",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/riddler/uxid",
    packages=find_packages(exclude=["docs*", "tests*"]),
)
