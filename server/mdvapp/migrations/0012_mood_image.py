# Generated by Django 2.1.2 on 2018-11-24 18:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mdvapp', '0011_auto_20181124_1723'),
    ]

    operations = [
        migrations.AddField(
            model_name='mood',
            name='image',
            field=models.ImageField(default='', upload_to=''),
        ),
    ]
