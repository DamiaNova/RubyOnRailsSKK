# Generated by Django 2.0.5 on 2018-06-01 15:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registracija', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='podaci',
            name='posBr',
            field=models.IntegerField(verbose_name='poštanski broj'),
        ),
    ]
