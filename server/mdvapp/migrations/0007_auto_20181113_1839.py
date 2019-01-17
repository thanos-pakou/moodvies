# Generated by Django 2.1.2 on 2018-11-13 16:39

from django.conf import settings
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('mdvapp', '0006_reviewlike'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='reviewlike',
            unique_together={('user', 'review')},
        ),
        migrations.AlterModelTable(
            name='reviewlike',
            table='reviewLike',
        ),
    ]
