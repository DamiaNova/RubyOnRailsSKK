# Generated by Django 2.0.5 on 2018-06-07 17:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registracija', '0006_auto_20180607_1911'),
    ]

    operations = [
        migrations.AlterField(
            model_name='podaci',
            name='posBr',
            field=models.CharField(max_length=5, verbose_name='poštanski broj'),
        ),
    ]
