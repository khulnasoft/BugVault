"""
Custom content renderers for djangorestframework
"""

import os

from django.utils import timezone
from rest_framework.renderers import JSONRenderer

import bugvault


def calc_env(env_str):
    if "prod" in env_str:
        return "prod"
    if "stage" in env_str:
        return "stage"
    if "uat" in env_str:
        return "uat"
    return "local"


class BugvaultRenderer(JSONRenderer):
    def render(self, data, accepted_media_type=None, renderer_context=None):
        # this custom renderer will inject a couple of meta fields to every
        # response that is sent back for API requests
        # TODO: remove this when we remove jira_stage_forwarder
        if not (
            renderer_context["request"].path.startswith(
                "/bugvault/api/v1/jira_stage_forwarder"
            )
        ):
            if data is None:
                data = {}
            data["dt"] = timezone.now()
            data["revision"] = os.getenv("OPENSHIFT_BUILD_COMMIT") or "unknown"
            data["version"] = bugvault.__version__
            data["env"] = calc_env(os.getenv("DJANGO_SETTINGS_MODULE"))
        return super().render(data, accepted_media_type, renderer_context)
