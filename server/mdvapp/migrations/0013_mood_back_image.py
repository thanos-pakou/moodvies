# Generated by Django 2.1.2 on 2018-11-24 18:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mdvapp', '0012_mood_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='mood',
            name='back_image',
            field=models.ImageField(default='', upload_to=''),
        ),
    ]