# Generated by Django 2.1.2 on 2019-02-06 17:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mdvapp', '0031_director_search_field'),
    ]

    operations = [
        migrations.AddField(
            model_name='director',
            name='visit',
            field=models.ManyToManyField(to='mdvapp.IPAddress'),
        ),
    ]