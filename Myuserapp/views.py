from django.shortcuts import render,HttpResponse,redirect
from miscellaneous import emailsend
from authorize import authcheck
from Myuserapp.models import UserSignup
from Myuserapp.forms import UserSignupForm
from django.contrib.auth.hashers import make_password,check_password
from miscellaneous.myconstants import role_manager
from authorize.authcheck import authentication
def index(request):
    return render(request, "home.html")

# Create your views here.
def usersignup(request):
    if request.method=="POST":
        #email is object&"email" is textbox name
        email = request.POST["email"]
        form=UserSignupForm(request.POST)
        otp, time = emailsend.gen_otp()
        f=form.save(commit=False)
        f.userFullName=request.POST["name"]
        f.userEmail = request.POST["email"]
        f.userPassword =make_password(request.POST["password"])
        f.userMobile = request.POST["mobile"]
        f.userAge = request.POST["age"]
        f.userAddress = request.POST["address"]
        f.userState = request.POST["state"]
        f.otpcolumn=otp
        f.otptime=time
        f.roleId_id = 1
        token =email[0:3]+request.POST['password'][0:2]+otp
        token = make_password(token)
        token=token.replace("+","")
        f.usertoken=token
        confirmationlink = " http://127.0.0.1:8000/verifyuser/?email=" + email + "&token=" + token
        f.otpconfirmation=confirmationlink
        f.isActive=True
        f.isverified=False
        #f.usertoken=otp
        f.save()
        emailsend.sendmail("link",email,confirmationlink)
        return render(request,'sign.html',{"sucess":True})
    return render(request,'sign.html')

def verify(request):
    useremail=request.GET['email']
    token=request.GET['token']
    email=UserSignup.objects.get(userEmail=useremail)
    try:
        if email.userEmail==useremail and token==email.usertoken:
            isverified=True
            email.otpcolumn=''
            email.usertoken=''
            email.otpconfirmation=''
            email.save()
            up = UserSignup(userEmail=useremail, isverified=isverified)
            up.save(update_fields=["isverified"])
            return HttpResponse(" verified user sucessfull done")
        else:
            return redirect('/404/')
    except:
        return redirect("/404/")

def login(request):
    if(request.method=="POST"):
        #email is object and 'email' is textbox name
        email = request.POST['email']
        password = request.POST['password']
        try:
            data=UserSignup.objects.get(userEmail=email)
            isvarified =data.isverified
            dbpassword=data.userPassword
            auth=check_password(password,dbpassword)
            if isvarified==True:
                if(auth==True):
                    request.session['Authentication']=True
                    request.session['email']=email
                    #the name inside the brackets are customizable.
                    request.session['roleId']=data.roleId_id
                    return redirect("/manager/")
                else:
                    return render(request,"login.html",{'wrongpw':True})
            else:
                return render(request, "login.html", {'i': True})
        except:
            return render(request,"login.html",{'wrongem':True})
    return render(request,"login.html")

def manager(request):
    try:
        authdata=authcheck.authentication(request.session['Authentication'],request.session['roleId'],role_manager)
        if(authdata==True):
            return render(request,'manager.html')
        else:
            authinfo,message=authdata
            if(message=="Invalid_user"):
                return redirect("/unauthoriz/")
            elif(message=="NotLogin"):
                return redirect("/notlogin/")
    except:
             return redirect("/notlogin/")

def pageNotFound(request):
    return render(request,'404.html')
def notLogin(request):
    return render(request,'notlogin.html')
def unauthorizedAccess(request):
    return render(request,'unauthoriz.html')
def logout(request):
    try:
        request.session.pop("Authentication")
        request.session.pop("email")
        request.session.pop("roleId")
        return redirect("/login/")
    except:
        return redirect("/login/")

def ChangePassword(request):
    if (request.method == "POST"):
        cpass = request.POST['cpass']

        apass = request.POST['apass']
        npass = make_password(request.POST['npass'])
        # cpass = request.POST['cpass']
        email=request.session['email']
        email_id = UserSignup.objects.get(userEmail=email)
        opass=email_id.userPassword
        auth = check_password(cpass,opass)
        auth2 = check_password(apass,npass)
        if auth==True and auth2==True:
            up = UserSignup(userEmail=email_id.userEmail,userPassword=npass)
            up.save(update_fields=["userPassword"])
            return HttpResponse("change successfully")
        else:
            return render(request, 'changePassword.html',{'n':True})

    return render(request,'changePassword.html')


