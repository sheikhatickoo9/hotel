from admin_app.models import UserSignup, UserRole
from django import forms


class UserSignupForm(forms.ModelForm):
     class Meta:
         model = UserSignup
         exclude = ["role",
                  "user_fullname",
                  "user_email",
                  "user_password",
                  "user_mobile",
                  "user_age",
                  "user_address",
                  "user_state",
                  "otp",
                  "otp_time",
                  "verify_link",
                  "is_active",
                  "is_verified",
                  "token"
                    ]

class UserRoleForm(forms.ModelForm):
     class Meta:
         model = UserRole
         exclude = ["role_name", "role_id"]