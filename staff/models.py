from django.db import models
#
#
class Department (models.Model):
    Dept_id = models.AutoField(primary_key= True)
    Dept_name = models.CharField(max_length=200, default= "")
    isActive = models.BooleanField(default= True)
class Add_staff (models.Model):
    Dept_id = models.ForeignKey(Department, on_delete = models.CASCADE)
    Fullname = models.CharField(max_length=200, default="")
    Email = models.CharField(max_length=200 , default="", primary_key=True)
    Phone_number = models.CharField(max_length=200, default="")
    Address = models.CharField(max_length= 200, default="")
    Post = models.CharField(max_length=200, default="")
    Salary = models.CharField(max_length=200, default="")
    Age = models.CharField(max_length=10, default="")

