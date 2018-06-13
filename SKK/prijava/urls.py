from django.urls import path
from django.conf.urls import url
from . import views

#URLconf
app_name='prijava'
urlpatterns=[
    path("",views.prijava.as_view(), name="prijava"),
    path("prijavljivanje/", views.prijavljivanje,name="prijavljivanje"),
    path("odjava/", views.odjava,name="odjava"),
    ]
