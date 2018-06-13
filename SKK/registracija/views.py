from django.http import request, HttpResponseRedirect
from django.views.generic import View
from django.urls import reverse
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login

from .forms import PodaciForma

class registracija(View):
    form_class=PodaciForma
    template="registracija/registracija.html"

    #Prikaži praznu formu
    def get(self,request):
        form=self.form_class(None)
        return render(request,self.template,{'form':form})

def registriranje(request):
    form_class=PodaciForma
    if request.POST:
        #Dohvaćanje unesenih podataka iz forme
        form=form_class(request.POST)
        if form.is_valid():
            user=form.save(commit=False)
            #čišćenje/normalizacija unesenih podataka
            username=form.cleaned_data['username']
            email=form.cleaned_data['email']
            password=form.cleaned_data['password']
            #Spremanje hashirane lozinke u bazu podataka
            user.set_password(password)
            #Spremanje novog korisnika u bazu podataka
            user.save()
            #Automatski login novonastalog korisnika
            login(request, user)
            #Preusmjeravanje na početnu stranicu za registrirane/prijavljene korisnike
            return HttpResponseRedirect(reverse("sustav:pocetna_reg"))
