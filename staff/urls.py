from django.conf.urls import url
from staff import views

urlpatterns =[
url(r'^addstaff/$',views.add_staff),
url(r'^department/$',views.add_department),

]
