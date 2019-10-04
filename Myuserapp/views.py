from django.shortcuts import render,HttpResponse
from miscellaneous import emailsend
from authorize import authcheck
from Myuserapp.forms import UserSignupForm
def index(request):
    return render(request, "home.html")

# Create your views here.
def usersignup(request):

    if request.method=="POST":
        email = request.POST["email"]
        form=UserSignupForm(request.POST)
        otp, time = emailsend.gen_otp()
        confirmationlink = " http://127.0.0.1:8000/verifyuser/?email=" + email + "&token=" + otp

        f=form.save(commit=False)

        f.userFullName=request.POST["name"]
        f.userEmail = request.POST["email"]
        f.userPassword = request.POST["password"]
        f.userMobile = request.POST["mobile"]
        f.userAge = request.POST["age"]
        f.userAddress = request.POST["address"]
        f.userState = request.POST["state"]
        f.otpcolumn=otp
        f.otptime=time
        f.roleId_id = 1
        f.otpconfirmation=confirmationlink
        f.isActive=True
        f.isverified=False
        f.save()
        emailsend.sendmail("link",email,confirmationlink)
        return render(request,'sign.html',{"sucess":True})


    return render(request,'sign.html')
def verify(request):
    emailid=request.GET['email']
    link=request.GET['token']
