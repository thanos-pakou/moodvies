# Generated by Django 2.1.2 on 2018-11-26 16:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mdvapp', '0014_customuser'),
    ]

    operations = [
        migrations.AddField(
            model_name='movie',
            name='search_field',
            field=models.CharField(default=None, max_length=1000),
        ),
    ]
