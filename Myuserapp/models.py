from django.db import models
#@sheikha
class UserRole(models.Model):
    roleId= models.AutoField(primary_key=True)
    #here autofield is auto increment  and it shud be primary key true.
    roleName=models.CharField(max_length=200,default="")
    isActive=models.BooleanField(default=True)

class UserSignup(models.Model):
    roleId= models.ForeignKey(UserRole,on_delete=models.CASCADE)
    userFullName= models.CharField(max_length=200,default="")
    userEmail= models.CharField(max_length=200,primary_key=True, default="")
    userPassword= models.CharField(max_length=200,default="")
    userMobile= models.CharField(max_length=200,default="")
    userAge= models.CharField(max_length=10,default="")
    userAddress=models.CharField(max_length=500,default="")
    userState=models.CharField(max_length=200,default="")
    otpcolumn=models.CharField(max_length=200,default="")
    otptime=models.CharField(max_length=200,default="")
    otpconfirmation=models.CharField(max_length=200,default="")
    isActive = models.BooleanField(default=True)
    isverified=models.BooleanField(default=False)
    usertoken=models.CharField(max_length=200,default="")

