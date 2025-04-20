from django.urls import path
from .views import update, updateWithImage

urlpatterns = [
    path('/<id_user>', update),
    path('/upload/<id_user>', updateWithImage),
    #path('/login', login)
]