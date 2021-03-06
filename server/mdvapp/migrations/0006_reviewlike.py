# Generated by Django 2.1.2 on 2018-11-13 16:27

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('mdvapp', '0005_auto_20181113_0525'),
    ]

    operations = [
        migrations.CreateModel(
            name='ReviewLike',
            fields=[
                ('idReviewLike', models.AutoField(db_column='idReviewLike', primary_key=True, serialize=False)),
                ('like', models.BooleanField()),
                ('created', models.DateTimeField(auto_now_add=True, null=True)),
                ('modified', models.DateTimeField(auto_now=True, null=True)),
                ('review', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='mdvapp.Review')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
