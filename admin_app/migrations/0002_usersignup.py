# Generated by Django 2.0.6 on 2019-10-03 17:04

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('admin_app', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserSignup',
            fields=[
                ('userFullName', models.CharField(default='', max_length=200)),
                ('userEmail', models.CharField(default='', max_length=200, primary_key=True, serialize=False)),
                ('userPassword', models.CharField(default='', max_length=200)),
                ('userMobile', models.CharField(default='', max_length=200)),
                ('userAge', models.CharField(default='', max_length=10)),
                ('userAddress', models.CharField(default='', max_length=500)),
                ('userState', models.CharField(default='', max_length=200)),
                ('isActive', models.BooleanField(default=True)),
                ('roleId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='admin_app.UserRole')),
            ],
        ),
    ]
