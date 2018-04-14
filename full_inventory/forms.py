from django import forms

from .models import Ubication, Unity, Pallet_Type, Almacen


class ProductsForm(forms.Form):
    material = forms.IntegerField()
    description = forms.CharField(widget=forms.Textarea)
    ple = forms.IntegerField()
    cajas = forms.IntegerField()
    unidades = forms.FloatField()
    expiration_date = forms.DateField()
    fecha_em = forms.DateField()
    bar_code = forms.IntegerField()
    cant_ideal = forms.IntegerField()
    almacen = forms.ModelChoiceField(queryset=Almacen.objects.all())
    location = forms.ModelChoiceField(queryset=Ubication.objects.all())
    unit__type = forms.ModelChoiceField(queryset=Unity.objects.all())
    pallet__type = forms.ModelChoiceField(queryset=Pallet_Type.objects.all())
