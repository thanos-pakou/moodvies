# Generated by Django 2.1.2 on 2019-02-07 16:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mdvapp', '0033_auto_20190206_1913'),
    ]

    operations = [
        migrations.AlterField(
            model_name='actor',
            name='visit',
            field=models.ManyToManyField(blank=True, to='mdvapp.IPAddress'),
        ),
    ]