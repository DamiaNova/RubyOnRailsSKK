from django.shortcuts import render, get_object_or_404
from django.views.generic.base import TemplateView
from django.http import request, HttpResponseRedirect
from django.urls import reverse
from datetime import datetime, timedelta

from .models import VozniRed, KupljeneKarte
from registracija.forms import PodaciForma
from prijava.forms import PrijavaForma

# Create your views here.

class pocetna_reg(TemplateView):
    template_name="sustav/pocetna_reg.html"

def voznired(request):
    vozni_red=VozniRed.voznired.all()
    danasnji_datum=datetime.now()
    danasnjidatum=danasnji_datum.date()
    trenutno_vrijeme=datetime.now()
    trenutnovrijeme=trenutno_vrijeme.time()
    context={"vozni_red":vozni_red,"danasnjidatum":danasnjidatum,"trenutnovrijeme":trenutnovrijeme}
    return render (request, "sustav/voznired.html",context)

def kupovina(request, voznired_id):
    vozni_red=get_object_or_404(VozniRed, pk=voznired_id)
    context={"vozni_red":vozni_red}
    return render (request, "sustav/kupovina.html", context)

def pregled(request):
    korisnickoIme=request.user.username
    lista_kupljenih_karata=KupljeneKarte.kupkarte.filter(korIme=korisnickoIme)
    kupljena_karta=None
    context={"lista_kupljenih_karata":lista_kupljenih_karata,"kupljena_karta":kupljena_karta}
    return render (request, "sustav/pregled.html", context)

def otkazivanje(request,karta_id):
    #Dohvaćanje odabrane kupljene karte
    karta=get_object_or_404(KupljeneKarte, pk=karta_id)
    #Trenutno vrijeme + 1 sat
    vrijeme=datetime.now() + timedelta(hours=1)
    vrijeme=vrijeme.time()
    #Varijabla za vrijeme polaska
    vrijeme_polaska=karta.vrijemePol
    sati=vrijeme_polaska.hour
    minutice=vrijeme_polaska.minute
    sekunde=vrijeme_polaska.second
    vrijemePolaska=vrijeme.replace(hour=sati, minute=minutice, second=sekunde)
    #Današnji datum
    danasnji_datum=datetime.now()
    danasnjidatum=danasnji_datum.date()
    if karta.datum == danasnjidatum:
        if vrijeme <= vrijeme_polaska:
            otkazivanje=True
            vrPol=karta.vrijemePol
            vrDol=karta.vrijemeDol
            dat=karta.datum
            cij=karta.cijena
            voznired=get_object_or_404(VozniRed, vrijemePol=vrPol,vrijemeDol=vrDol,
                                       datum=dat,cijena=cij)
        else:
            otkazivanje=False
    else:
        otkazivanje=True
        vrPol=karta.vrijemePol
        vrDol=karta.vrijemeDol
        dat=karta.datum
        cij=karta.cijena
        voznired=get_object_or_404(VozniRed, vrijemePol=vrPol,vrijemeDol=vrDol,
                                   datum=dat,cijena=cij)
    context={"karta":karta,"vrijeme":vrijeme,"otkazivanje":otkazivanje}
    return render (request, "sustav/otkaz.html", context)

def cancel(request,karta_id):
    karta=get_object_or_404(KupljeneKarte, pk=karta_id)
    karta.delete()
    vozni_red_karta=VozniRed.voznired.get(vrijemePol=karta.vrijemePol, vrijemeDol=karta.vrijemeDol,
                                             datum=karta.datum,cijena=karta.cijena)
    vozni_red_karta.brojKar+=1
    vozni_red_karta.save()

    return HttpResponseRedirect(reverse("sustav:pregled"))

def purchase(request,voznired_id):
    if request.POST:
        #Dohvaćanje objekta sa detaljima kupljene karte iz baze podataka
        vozni_red=get_object_or_404(VozniRed, pk=voznired_id)
        if vozni_red.brojKar > 0:
            #Stvaranje novog objekta za context u template-u 
            kupljena_karta=vozni_red
            #Spremanje potrebnih podataka
            korIme=request.user.username
            brKartice=request.POST['brKartice']
            datum=vozni_red.datum
            vrijemePol=vozni_red.vrijemePol
            vrijemeDol=vozni_red.vrijemeDol
            cijena=vozni_red.cijena
            kupljeno=KupljeneKarte(korIme=korIme,brKartice=brKartice,datum=datum,vrijemePol=vrijemePol,
                                  vrijemeDol=vrijemeDol,cijena=cijena)
            kupljeno.save()
            vozni_red.brojKar-=1
            vozni_red.save()
        elif vozni_red.brojKar <= 0:
            kupljena_karta=False
        korisnickoIme=request.user.username
        lista_kupljenih_karata=KupljeneKarte.kupkarte.filter(korIme=korisnickoIme)
        context={"lista_kupljenih_karata":lista_kupljenih_karata,"kupljena_karta":kupljena_karta}
        return render (request, "sustav/pregled.html", context)
        
