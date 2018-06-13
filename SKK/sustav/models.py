from django.db import models

# Create your models here.
class VozniRed(models.Model):
    vrijemePol=models.TimeField('vrijeme polaska')
    vrijemeDol=models.TimeField('vrijeme dolaska')
    datum=models.DateField()
    brojKar=models.PositiveSmallIntegerField('broj dostupnih karata')
    cijena=models.DecimalField(max_digits=5, decimal_places=2)

    #Preimenovanje Manager-a od "objects" u "voznired"
    voznired = models.Manager()

class KupljeneKarte(models.Model):
    korIme=models.CharField('korisničko ime',max_length=30)
    brKartice=models.BigIntegerField('broj kreditne kartice')
    datum=models.DateField()
    vrijemePol=models.TimeField('vrijeme polaska')
    vrijemeDol=models.TimeField('vrijeme dolaska')
    cijena=models.DecimalField(max_digits=5, decimal_places=2)

    #Preimenovanje Manager-a od "objects" u "kupkarte"
    kupkarte = models.Manager()
