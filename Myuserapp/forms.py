from Myuserapp.models import UserSignup
from django import forms
class UserSignupForm(forms.ModelForm):
    class Meta():
        model=UserSignup
        exclude=["roleId",
                 "userFullName",
                 "userEmail",
                 "userPassword",
                 "userMobile",
                 "userAge",
                 "userAddress",
                 "userState",
                 "otpcolumn",
                 "otptime",
                 "otpconfirmation",
                 "isActive",
                 "usertoken",
                 "isverified"
                 ]