# Generated by Django 2.0.5 on 2018-06-07 17:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registracija', '0007_auto_20180607_1922'),
    ]

    operations = [
        migrations.AlterField(
            model_name='podaci',
            name='brKartice',
            field=models.PositiveIntegerField(verbose_name='broj kreditne kartice'),
        ),
        migrations.AlterField(
            model_name='podaci',
            name='posBr',
            field=models.PositiveIntegerField(verbose_name='poštanski broj'),
        ),
    ]
