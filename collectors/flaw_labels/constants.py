"""
flaw label collector constants
"""

from bugvault.helpers import get_env

FLAW_LABELS_REPO_URL = get_env("FLAW_LABELS_URL", "")
FLAW_LABELS_REPO_BRANCH = "main"
