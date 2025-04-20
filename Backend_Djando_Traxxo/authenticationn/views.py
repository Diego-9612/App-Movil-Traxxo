from django.shortcuts import render # type: ignore
from rest_framework.response import Response # type: ignore
from rest_framework.decorators import api_view # type: ignore
from rest_framework import status # type: ignore
from users.serializers import UserSerializer
from users.models import User
from rest_framework_simplejwt.tokens import RefreshToken # type: ignore
import bcrypt # type: ignore

# Create your views here.
# GET -> OBTENER
# POST -> CREAR
# PUT -> ACTUALIZAR
# DELETE -> BORRAR

# 200 RESPUESTAS EXITOSAS
# 400 O 500 ERRORES

@api_view(['POST'])
def register(request):
    serializer = UserSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def login(request):
    email = request.data.get('email')
    password = request.data.get('password')

    if not email or not password:
        return Response({ "error": "El email y la contraseña son obligatorios" }, status=status.HTTP_400_BAD_REQUEST)

    try:
        user = User.objects.get(email=email)
    except User.DoesNotExist:
        return Response({'error': 'El email o la contraseña no son válidos'}, status=status.HTTP_401_UNAUTHORIZED)

    if bcrypt.checkpw(password.encode('utf-8'), user.password.encode('utf-8')):
        refresh_token = RefreshToken.for_user(user)
        access_token = str(refresh_token.access_token)
        user_data = {
            "user":{
                "id": user.id,
                "name": user.name,
                "lastname": user.lastname,
                "email": user.email,
                "phone": user.phone,
                "image": user.image,
                "notification_token": user.notification_token,
            },
            "token": "Bearer " + access_token
        }
        return Response(user_data, status=status.HTTP_200_OK)
    else:
        return Response({'error': 'El email o la contraseña no son válidos'}, status=status.HTTP_401_UNAUTHORIZED)

