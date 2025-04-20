from rest_framework import serializers # type: ignore
from .models import User
import bcrypt; # type: ignore

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'name', 'lastname', 'email', 'phone', 'image', 'password', 'notification_token']
        extra_kwargs = {
            'password': {'write_only': True}
        }

    def create(self, validated_data):
        raw_password = validated_data.pop('password')
        hashed_password = bcrypt.hashpw(raw_password.encode('utf-8'), bcrypt.gensalt())
        validated_data['password'] = hashed_password.decode('utf-8')
        user = User.objects.create(**validated_data)
        return user
