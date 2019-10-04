from django.shortcuts import render,HttpResponse
from miscellaneous import emailsend
from authorize import authcheck
def index(request):
    return render(request, "home.html")

# Create your views here.
def usersignup(request):
    if request.method=="POST":
        email=request.POST['emailid']
        otp = emailsend.gen_otp()
        confirmationlink=" http://127.0.0.1:8000/verifyuser/?email="+email+"&token="+otp
def verify(request):
    emailid=request.GET['email']
    link=request.GET['token']
