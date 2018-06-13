from django import forms
from django.forms import ModelForm
from django.contrib.auth.models import User

class PodaciForma(ModelForm):
    password=forms.CharField(widget=forms.PasswordInput,min_length=8)
    class Meta:
        model=User
        fields=['username','email','password']
