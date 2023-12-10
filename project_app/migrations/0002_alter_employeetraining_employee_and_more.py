# Generated by Django 5.0 on 2023-12-10 05:12

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('project_app', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='employeetraining',
            name='employee',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='project_app.employees'),
        ),
        migrations.AlterUniqueTogether(
            name='employeetraining',
            unique_together={('employee', 'training')},
        ),
    ]