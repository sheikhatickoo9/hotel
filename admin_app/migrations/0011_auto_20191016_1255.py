# Generated by Django 2.0.6 on 2019-10-16 17:25

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('admin_app', '0010_auto_20191016_1252'),
    ]

    operations = [
        migrations.RenameField(
            model_name='usersignup',
            old_name='role_id',
            new_name='role',
        ),
    ]
