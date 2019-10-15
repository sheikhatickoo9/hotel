from admin_app import views
from django.conf.urls import url

urlpatterns = [
    url(r'^super_user_login/$', views.superuser_login),
    url(r'^admin_page/$',views.admin_page)
    ]
