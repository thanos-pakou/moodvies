# Generated by Django 2.1.2 on 2019-01-30 15:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mdvapp', '0018_auto_20190130_1719'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ipaddress',
            name='ip',
            field=models.CharField(blank=True, db_column='nameActor', max_length=45, null=True, unique=True),
        ),
    ]
