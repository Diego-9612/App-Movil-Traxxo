from rest_framework import serializers # type: ignore
from .models import User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'name', 'lastname', 'email', 'phone', 'image', 'password', 'notification_token']

    def create(self, validated_data):
        user = User.objects.create(**validated_data)
        return user
