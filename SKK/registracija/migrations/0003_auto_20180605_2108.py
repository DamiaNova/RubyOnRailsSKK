# Generated by Django 2.0.6 on 2018-06-05 19:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registracija', '0002_auto_20180601_1742'),
    ]

    operations = [
        migrations.AddField(
            model_name='podaci',
            name='brKartice',
            field=models.IntegerField(null=True, verbose_name='broj kreditne kartice'),
        ),
        migrations.AlterField(
            model_name='podaci',
            name='posBr',
            field=models.IntegerField(null=True, verbose_name='poštanski broj'),
        ),
    ]