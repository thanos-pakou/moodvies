# Generated by Django 2.1.2 on 2019-02-05 04:23

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('mdvapp', '0028_feedback'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feedback',
            name='ip_address',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='mdvapp.IPAddress'),
        ),
    ]
