"""
    bugvault-service
"""

from django.apps import AppConfig


class BUGVAULTConfig(AppConfig):
    name = "bugvault"

    def ready(self):
        from . import signals  # noqa: F401
