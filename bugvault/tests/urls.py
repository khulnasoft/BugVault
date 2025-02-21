from django.urls import path

from bugvault.tests.api_views import my_view

urlpatterns = [
    path("fail-endpoint/", my_view, name="test-view"),
]
