from django.http import request, HttpResponseRedirect
from django.urls import reverse
from django.shortcuts import render,redirect 
from django.views.generic import View
from django.contrib.auth import authenticate, login, logout as django_logout

from .forms import PrijavaForma

class prijava(View):
    form_class=PrijavaForma
    template="prijava/prijava.html"

    #Prikaži praznu formu
    def get(self,request):
        form=self.form_class(None)
        return render(request,self.template,{'form':form})

def prijavljivanje(request):
    form_class=PrijavaForma
    if request.POST:
        #Dohvaćanje unesenih podataka iz forme
        form=form_class(request.POST)
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request,username=username, password=password)
        if user is not None:
            login(request, user)
            return HttpResponseRedirect(reverse("sustav:pocetna_reg"))
        else:
            return HttpResponseRedirect(reverse("prijava:prijava"))

def odjava(request):
    django_logout(request)
    return HttpResponseRedirect(reverse("home"))
