# Generated by Django 2.0.4 on 2018-04-10 02:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('full_inventory', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='eventomaterial',
            name='cantidad_solicitada',
            field=models.BigIntegerField(default=1),
            preserve_default=False,
        ),
    ]
