import uuid

import pytest
from django.conf import settings
from taskman.constants import TASKMAN_API_VERSION

from bugvault.constants import BUGVAULT_API_VERSION


@pytest.fixture(autouse=True)
def use_debug(settings):
    """Enforce DEBUG=True in all tests because pytest hardcodes it to False

    See: https://github.com/pytest-dev/pytest-django/pull/463

    Once the `--django-debug-mode` option is added to pytest, we can get rid of this fixture and
    use the CLI setting via pytest.ini:
    https://docs.pytest.org/en/latest/customize.html#adding-default-options
    """
    settings.DEBUG = True


@pytest.fixture(autouse=True)
def enable_db_access_for_all_tests(db):
    pass


@pytest.fixture
def test_scheme_host():
    return "http://bugvault-service:8000/taskman"


@pytest.fixture
def api_version():
    return TASKMAN_API_VERSION


@pytest.fixture
def test_api_uri(test_scheme_host, api_version):
    return f"{test_scheme_host}/api/{api_version}"


@pytest.fixture(autouse=True)
def auto_enable_jira_task_sync(enable_jira_task_sync) -> None:
    """
    the tests should be immune to what .env you build the testrunner with
    """
    pass


@pytest.fixture
def acl_read():
    return [
        uuid.uuid5(uuid.NAMESPACE_URL, f"https://bugvault.prod.redhat.com/ns/acls#{group}")
        for group in settings.PUBLIC_READ_GROUPS
    ]


@pytest.fixture
def acl_write():
    return [
        uuid.uuid5(
            uuid.NAMESPACE_URL,
            f"https://bugvault.prod.redhat.com/ns/acls#{settings.PUBLIC_WRITE_GROUP}",
        )
    ]


@pytest.fixture
def test_bugvault_scheme_host():
    return "http://bugvault-service:8000/bugvault"


@pytest.fixture
def bugvault_api_version():
    return BUGVAULT_API_VERSION


@pytest.fixture
def test_bugvault_api_uri(test_bugvault_scheme_host, bugvault_api_version):
    return f"{test_bugvault_scheme_host}/api/{bugvault_api_version}"
