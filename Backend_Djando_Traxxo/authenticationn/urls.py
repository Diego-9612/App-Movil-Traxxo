from django.urls import path # type: ignore
from .views import register, login

urlpatterns = [
    path('/register', register),
    path('/login', login)
]