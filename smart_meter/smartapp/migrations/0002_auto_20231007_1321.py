# Generated by Django 3.2.20 on 2023-10-07 07:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('smartapp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Register',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Name', models.CharField(max_length=50)),
                ('Phone', models.BigIntegerField()),
                ('Place', models.CharField(max_length=50)),
                ('Post', models.CharField(max_length=50)),
                ('Pin', models.BigIntegerField()),
                ('Consumer_no', models.CharField(max_length=50)),
                ('Email', models.CharField(max_length=50)),
                ('Password', models.CharField(max_length=50)),
                ('Confirm_password', models.CharField(max_length=50)),
            ],
        ),
        migrations.AlterField(
            model_name='bill',
            name='Last_date',
            field=models.CharField(max_length=40),
        ),
    ]