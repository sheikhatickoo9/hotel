from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth.models import User
from admin_app.models import UserRole
from admin_app.forms import UserSignupForm
from miscellaneous.genericFunction import string_generate
from miscellaneous import emailsend
from authorize import authcheck
from admin_app.models import UserSignup
from django.contrib.auth.hashers import make_password,check_password
from miscellaneous.myconstants import role_manager,role_admin
from authorize.authcheck import authentication


def superuser_login(request):
    if request.method == "POST":
        username = request.POST['email']
        password = request.POST['password']
        try:
            data = User.objects.get(username=username)
            if check_password(password, data.password):
                request.session['role_name'] = "superuser"
                return render(request, "super_user_dashboard.html")
            else:
                return render(request, "super_login.html", {'wrong_password': True})
        except:
            return render(request, "super_login.html", {'wrong_email': True})
    return render(request, "super_login.html")


def signup(request):
    data = UserRole.objects.all()
    if request.method=="POST":
        otp, time = emailsend.gen_otp()
        form = UserSignupForm(request.POST)
        if form.is_valid():
            f = form.save(commit=False)
            # html page se role aaa rha ha
            f.role_id = request.POST['role']
            f.user_fullname = request.POST["name"]
            f.user_email = request.POST["email"]
            """generate a unique pasword without  encryption so we stored it in to password"""
            password = string_generate()
            f.user_password = make_password(password)
            f.user_mobile = request.POST["mobile"]
            f.user_age = request.POST["age"]
            f.user_address = request.POST["address"]
            f.user_state = request.POST["state"]
            f.otp = otp
            f.otp_time = time
            link = make_password(string_generate()).replace("+", "")
            confirmation_link = "http://127.0.0.1:8000/verify/?link=" + link
            f.verify_link = link
            f.save()
            emailsend.verify_link_send("link",request.POST['email'],confirmation_link, password)
            return HttpResponse("email send successfully")
    return render(request,'sign.html', {'role': data})


def verify(request):
    link = request.GET['link']
    try:
        data = UserSignup.objects.get(verify_link=link)
        request.session["verify_link"]="link"
        up = UserSignup(user_email=data.user_email, is_verified=1, is_active=1, verify_link="")
        up.save(update_fields=["is_verified", "is_active", "verify_link"])
        return redirect("/login/")
    except:
        return redirect("/404/")

#
def login(request):
    if(request.method=="POST"):
        email = request.POST['email']

        data = UserSignup.objects.get(user_email=email)
        request.session['role_name'] = "admin"
        password = request.POST['password']
        try:
            if check_password(password,data.user_password):
                if data.is_verified == 1:
                    if data.is_active == 1:
                        request.session['authenticate'] = True
                        request.session['email'] = email
                        request.session['roleId'] = data.role_id
                        request.session['name'] = data.user_fullname
                        # if data.role_id == 1:
                        if data.role_id==1:
                            return redirect("/admin_page/")
                        if data.role_id == 2:
                            return redirect("/manager/")
            else:
                return render(request,"login.html",{'wrong_password':True})
        except:
            return render(request,"login.html",{'wrong_email':True})
    return render(request,"login.html")



def manager(request):
    # d=role_manager
    # return HttpResponse(d)
    try:
        email=request.session['email']
        data=UserSignup.objects.get(user_email=email)
        authdata=authcheck.authentication(request.session['authenticate'],request.session['roleId'],data.role_id)
        if(authdata==True):
            if data.role_id==2:
                return render(request,'manager.html')
            elif data.role_id==1:
                return render(request, 'admin.html')

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
        cupass = request.POST['cpass']
        conpass = request.POST['conpass']
        npass = request.POST['npass']
        # cpass = request.POST['cpass']
       # email=request.session['email']
        data = UserSignup.objects.get(user_email=request.session['email'])
        if check_password(cupass, data.user_password):
            if conpass == npass:
        # opass=email_id.userPassword
        # auth = check_password(cpass,opass)
        # auth2 = check_password(apass,npass)
        # if auth==True and auth2==True:
                up = UserSignup(user_email=request.session['email'],user_password=make_password(npass))
                up.save(update_fields=["user_password"])
                return HttpResponse("change successfully")
            else:
                return render(request, 'changePassword.html',{'n':True})
        else:
            return render(request, 'changePassword.html', {'y': True})

    return render(request,'changePassword.html')


def admin_page(request):
    return render(request,"admin.html")
def frontpage(request):
    return render(request,'frontpage.html')
def show_profile(request):
    email = request.session['email']
    data = UserSignup.objects.get(user_email=email)
    return render(request,"viewprofile.html",{'d':data})


def update_profile(request):
    pass



def edit_profile(request):
    useremail = request.GET["email"]
    data=UserSignup.objects.get(user_email=useremail)
    if request.method=="POST":
        pass
        username = request.POST["userfullname"]
        userpassword = make_password(request.POST["userpassword"])
        usermobile = request.POST["usermobile"]
        userage = request.POST["userage"]
        useraddress = request.POST["useraddress"]
        userstate = request.POST["userstate"]
        up=UserSignup(user_email=useremail,user_fullname=username,user_password=userpassword,user_mobile=usermobile,user_age=userage,user_address=useraddress,user_state=userstate)
        up.save(update_fields=["user_fullname", "user_password", "user_mobile", "user_age", "user_address", "user_state"])
        return render(request,'editprofile.html',{"sucess":True})
    return render(request,'editprofile.html',{"p":data})