from django.db import models 

class UserHasRoles(models.Model):
    id_user = models.ForeignKey('users.User', on_delete=models.CASCADE, db_column="id_user")
    id_rol = models.ForeignKey('roles.Role', on_delete=models.CASCADE, db_column="id_rol")

    class Meta:
        db_table = 'user_has_roles'
        unique_together = ('id_user', 'id_rol')


class User(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    lastname = models.CharField(max_length=255)
    email = models.EmailField(unique=True)
    phone = models.CharField(max_length=20, unique=True)
    image = models.CharField(max_length=255, null=True, blank=False)
    password = models.CharField(max_length=255)
    notification_token = models.CharField(max_length=255, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    roles = models.ManyToManyField(
        'roles.Role',
        through='users.UserHasRoles',
        related_name='users')

    class Meta:
        db_table = 'users'

