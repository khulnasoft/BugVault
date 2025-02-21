"""
    bugvault exceptions
"""
from rest_framework import status


class BUGVAULTException(Exception):
    """Base Exception class for bugvault specific exceptions"""


class DataInconsistencyException(BUGVAULTException):
    """Data Inconsistency Exception"""

    http_code = status.HTTP_409_CONFLICT


class InvalidTestEnvironmentException(BUGVAULTException):
    """Invalid Test Environment Exception"""
