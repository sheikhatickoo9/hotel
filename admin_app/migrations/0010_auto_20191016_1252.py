# Generated by Django 2.0.6 on 2019-10-16 17:22

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('admin_app', '0009_auto_20191016_1247'),
    ]

    operations = [
        migrations.RenameField(
            model_name='usersignup',
            old_name='role',
            new_name='role_id',
        ),
    ]
