from django.views.generic.base import TemplateView
from django.shortcuts import render
from django.http import request
from sustav.models import VozniRed

class home(TemplateView):
    template_name="SKK/home.html"
    
def voznired(request):
    vozni_red=VozniRed.voznired.all()
    context={"vozni_red":vozni_red}
    return render (request, "SKK/voznired.html",context)

