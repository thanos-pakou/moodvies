# Generated by Django 2.1.2 on 2019-02-05 02:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mdvapp', '0026_auto_20190204_2343'),
    ]

    operations = [
        migrations.AlterField(
            model_name='actor',
            name='visit',
            field=models.ManyToManyField(to='mdvapp.IPAddress'),
        ),
    ]
