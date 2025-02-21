import ldap
from django_auth_ldap.config import GroupOfNamesType, LDAPSearch

from .settings import *

# SECURITY WARNING: keep the secret key used in production/stage secret!
SECRET_KEY = get_random_secret_key()  # pragma: allowlist secret

# Minimal group for read access of public flaws in BUGVAULT
PUBLIC_READ_GROUPS = ["data-prodsec"]
# Minimal group for write access of public flaws in BUGVAULT
PUBLIC_WRITE_GROUP = "data-prodsec-write"
# Minimal group for read access of embargoed flaws in BUGVAULT
EMBARGO_READ_GROUP = "data-topsecret"
# Minimal group for write access of embargoed flaws in BUGVAULT
EMBARGO_WRITE_GROUP = "data-topsecret-write"
# Minimal group for read access of internal flaws in BUGVAULT
INTERNAL_READ_GROUP = "data-internal-read"
# Minimal group for write access of internal flaws in BUGVAULT
INTERNAL_WRITE_GROUP = "data-internal-write"

# Contains all non-admin groups
ALL_GROUPS = [
    *PUBLIC_READ_GROUPS,
    PUBLIC_WRITE_GROUP,
    EMBARGO_READ_GROUP,
    EMBARGO_WRITE_GROUP,
    INTERNAL_READ_GROUP,
    INTERNAL_WRITE_GROUP,
]
# Minimal group for managing the BUGVAULT service
SERVICE_MANAGE_GROUP = "bugvault-service-manage"

DEBUG = True

ALLOWED_HOSTS = ["*"]

INTERNAL_IPS = ["127.0.0.1", "::1"]

AUTHENTICATION_BACKENDS += ("django_auth_ldap.backend.LDAPBackend",)

AUTH_LDAP_BIND_DN = "cn=admin,dc=redhat,dc=com"
AUTH_LDAP_BIND_PASSWORD = "adminpassword"
AUTH_LDAP_USER_SEARCH = LDAPSearch(
    "ou=users,dc=redhat,dc=com", ldap.SCOPE_SUBTREE, "(uid=%(user)s)"
)

AUTH_LDAP_GROUP_SEARCH = LDAPSearch(
    "ou=users,dc=redhat,dc=com",
    ldap.SCOPE_SUBTREE,
    "(objectClass=groupOfNames)",
)
AUTH_LDAP_GROUP_TYPE = GroupOfNamesType(name_attr="cn")

AUTH_LDAP_ALWAYS_UPDATE_USER = True
AUTH_LDAP_FIND_GROUP_PERMS = True
AUTH_LDAP_MIRROR_GROUPS = True
AUTH_LDAP_USER_ATTR_MAP = {
    "first_name": "givenName",
    "last_name": "sn",
    "email": "mail",
}

AUTH_LDAP_REQUIRE_GROUP = "cn=active,ou=users,dc=redhat,dc=com"

AUTH_LDAP_USER_FLAGS_BY_GROUP = {
    "is_active": "cn=active,ou=users,dc=redhat,dc=com",
    "is_staff": f"cn={SERVICE_MANAGE_GROUP},ou=users,dc=redhat,dc=com",
    "is_superuser": f"cn={SERVICE_MANAGE_GROUP},ou=users,dc=redhat,dc=com",
}


DATABASES = {
    "default": {
        "NAME": "bugvault",
        "USER": "bugvault_app_user",
        "PASSWORD": "passw0rd",
        "HOST": "bugvault-data",
        "PORT": "5432",
        "ENGINE": "psqlextra.backend",
        "ATOMIC_REQUESTS": True,  # perform HTTP requests as atomic transactions
        "OPTIONS": {
            "sslmode": "require",
            # prevent libpq from automatically trying to connect to the db via GSSAPI
            "gssencmode": "disable",
            # this is a hack due to our inability to set a custom parameter either at
            # the database or role level in managed databases such as AWS RDS
            "options": "-c bugvault.acl=00000000-0000-0000-0000-000000000000",
        },
        "CONN_MAX_AGE": 120,
    }
}

STATIC_ROOT = "/var/www/bugvault/static/"
STATIC_URL = "/static/"

INSTALLED_APPS += ["bugvault.tests"]
