from django.db import models


class UserRole(models.Model):
    role_id = models.AutoField(primary_key=True)
    role_name = models.CharField(max_length=200, default="", unique=True)

    def __str__(self):
        return str(self.role_id) + " " + str(self.role_name)


class UserSignup(models.Model):
    role = models.ForeignKey(UserRole, on_delete=models.CASCADE)
    user_fullname = models.CharField(max_length=200, default="", null=True)
    user_email = models.CharField(max_length=200, primary_key=True, default="")
    user_password = models.CharField(max_length=200, default="", null=True)
    user_mobile = models.CharField(max_length=200, default="", null=True)
    user_age = models.CharField(max_length=10, default="", null=True)
    user_address = models.CharField(max_length=500, default="", null=True)
    user_state = models.CharField(max_length=200, default="", null=True)
    otp = models.CharField(max_length=200,default="", null=True)
    otp_time = models.CharField(max_length=200,default="", null=True)
    verify_link = models.CharField(max_length=200, default="", null=True)
    is_active = models.BooleanField(default=0)
    is_verified = models.BooleanField(default=0)
    token = models.CharField(max_length=200, default="", null=True)


    def __str__(self):
        return str(self.user_fullname)