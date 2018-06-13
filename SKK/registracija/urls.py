from django.urls import path
from . import views

#URLconf
app_name='registracija'
urlpatterns=[
    #Registracija
    path("",views.registracija.as_view(), name="registracija"),
    path("registriranje/",views.registriranje, name="registriranje"),
    ]
