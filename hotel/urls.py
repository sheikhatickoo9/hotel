from django.contrib import admin
from admin_app import views
from django.conf.urls import url, include

urlpatterns = [
    url('admin/', admin.site.urls),
    url(r'^', include('admin_app.urls')),
    url(r'^signup/$',views.signup),
    url(r'^verify/$',views.verify),
    url(r'^login/$',views.login,name='login'),
    url(r'^manager/$',views.manager),
    url(r'^404/$',views.pageNotFound),
    url(r'^notlogin/$',views.notLogin),
    url(r'^unauthoriz/$',views.unauthorizedAccess),
    url(r'^logout/$',views.logout),
    url(r'^changepassword/$',views.ChangePassword),
    url(r'^frontpage/$',views.frontpage),
    url(r'^viewprofile/$',views.show_profile,name="viewprofile"),
url(r'^editprofile/$',views.edit_profile,name="editprofile")

]

