from staff.models import Department,Add_staff
from django import forms
class DepartmentForm(forms.ModelForm):
    class Meta:
        model = Department
        exclude = ["Dept_id",
                   "Dept_name",
                   "isActive"
                   ]
class Add_staffForm(forms.ModelForm):
        class Meta:
            model = Add_staff
            exclude =["Dept_id",
                        "Fullname",
                         "Email",
                         "Phone_number",
                         "Address",
                         "Post",
                         "Salary",
                         "Age"]








