# Generated by Django 2.1.2 on 2019-02-07 20:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mdvapp', '0034_auto_20190207_1823'),
    ]

    operations = [
        migrations.AddField(
            model_name='movie',
            name='visit',
            field=models.ManyToManyField(blank=True, to='mdvapp.IPAddress'),
        ),
        migrations.AlterField(
            model_name='director',
            name='image',
            field=models.ImageField(blank=True, default='', null=True, upload_to=''),
        ),
        migrations.AlterField(
            model_name='director',
            name='visit',
            field=models.ManyToManyField(blank=True, to='mdvapp.IPAddress'),
        ),
    ]