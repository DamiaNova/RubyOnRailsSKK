# Generated by Django 2.0.5 on 2018-06-01 15:38

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Podaci',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ime', models.CharField(max_length=30)),
                ('prezime', models.CharField(max_length=30)),
                ('datumRod', models.DateField(verbose_name='datum rođenja')),
                ('adresa', models.CharField(max_length=50, verbose_name='naziv ulice i kućni broj')),
                ('posBr', models.IntegerField(max_length=11, verbose_name='poštanski broj')),
                ('grad', models.CharField(max_length=30)),
                ('drzava', models.CharField(max_length=30, verbose_name='država')),
                ('email', models.EmailField(max_length=50, verbose_name='e-mail')),
                ('lozinka', models.CharField(max_length=10)),
            ],
        ),
    ]