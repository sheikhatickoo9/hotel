from staff.models import Department
from django import forms
class DepartmentForm(forms.ModelForm):
    class Meta:
        model = Department
        exclude = ["Dept_id",
                   "Dept_name",
                   ]

