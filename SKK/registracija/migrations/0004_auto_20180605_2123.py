# Generated by Django 2.0.6 on 2018-06-05 19:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registracija', '0003_auto_20180605_2108'),
    ]

    operations = [
        migrations.AlterField(
            model_name='podaci',
            name='brKartice',
            field=models.BigIntegerField(null=True, verbose_name='broj kreditne kartice'),
        ),
    ]
