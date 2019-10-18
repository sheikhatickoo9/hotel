from django.shortcuts import render
from staff.forms import DepartmentForm,Add_staffForm
from staff.models import Department
# Create your views here.
def add_staff(request):
    data=Department.objects.all()
    if request.method == "POST":
        form = Add_staffForm(request.POST)
        f = form.save(commit=False)
        f.Fullname = request.POST["name"]
        f.Email = request.POST["email"]
        f.Phone_number = request.POST["mobile"]
        f.Address = request.POST["address"]
        f.Post = request.POST["post"]
        f.Salary = request.POST["salary"]
        f.Age = request.POST["age"]
        f.Dept_id_id = request.POST["dept"]
        f.save()
        return render(request,'add_staff.html',{"s":True})
    return render(request,"add_staff.html",{"d":data})

def add_department(request):
    if request.method == "POST":
        form = DepartmentForm(request.POST)
        f = form.save(commit=False)
        f.Dept_name = request.POST["deptname"]
        f.isActive = True
        f.save()
        return render(request, 'department.html',{"s":True})
    return render(request,'department.html')
