# Generated by Django 2.0.6 on 2019-10-04 06:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Myuserapp', '0004_auto_20191004_0942'),
    ]

    operations = [
        migrations.AddField(
            model_name='usersignup',
            name='usertoken',
            field=models.CharField(default='', max_length=200),
        ),
    ]
