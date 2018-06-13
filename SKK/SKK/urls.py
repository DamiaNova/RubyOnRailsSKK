"""SKK URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
    
"""
from django.contrib import admin
from django.urls import path, include
from . import views

#Root URLconf
urlpatterns = [
    path('',views.home.as_view(), name="home"), #Home page
    path('voznired/',views.voznired, name="voznired"), #Prikaz voznog reda za goste
    path('prijava/', include('prijava.urls')),#početni URL za aplikaciju prijave korisnika
    path('registracija/', include('registracija.urls')),#početni URL za aplikaciju registracije korisnika
    path('pocetna/', include('sustav.urls')),#početni URL za aplikaciju sustava za kupovinu karata
    path('admin/', admin.site.urls), #URL za administracijsku stranicu
]
