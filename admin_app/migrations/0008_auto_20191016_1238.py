# Generated by Django 2.0.6 on 2019-10-16 17:08

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('admin_app', '0007_usersignup_user_image'),
    ]

    operations = [
        migrations.RenameField(
            model_name='userrole',
            old_name='role_id',
            new_name='role',
        ),
    ]
