from django.urls import path
from . import views

#URLconf
app_name='sustav'
urlpatterns=[
    path("",views.pocetna_reg.as_view(), name="pocetna_reg"),
    path("voznired/",views.voznired, name="voznired"),
    path("voznired/kupovina/<int:voznired_id>/",views.kupovina, name="kupovina"),
    path("voznired/kupovina/<int:voznired_id>/pregled",views.purchase, name="purchase"),
    path("pregled/",views.pregled, name="pregled"),
    path("pregled/otkazivanje/<int:karta_id>/",views.otkazivanje, name="otkazivanje"),
    path("pregled/otkazivanje/<int:karta_id>/cancel/",views.cancel, name="cancel"),
    ]
