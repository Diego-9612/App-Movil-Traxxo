from django.urls import path # type: ignore
from .views import create

urlpatterns = [
    path('', create)
]