from django.http import HttpResponseRedirect
from django.shortcuts import render

from full_inventory.forms import ProductsForm
from .models import Product


# Create your views here.


def index(request):
    # ordena la lista de todos los productos en orden ascendente
    products = Product.objects.order_by('-material').all()
    #
    return render(request, 'index.html', {'products': products})


def product_detail(request, pk):
    products = Product.objects.get(idProduct=pk)
    return render(request, 'product_detail.html', {'Product': products})


def product_add(request):
    if request.method == 'POST':
        product__form = ProductsForm(request.POST)
        if product__form.is_valid():
            material = product__form.cleaned_data['material']
            description = product__form.cleaned_data['description']
            ple = product__form.cleaned_data['ple']
            cajas = product__form.cleaned_data['cajas']
            unidades = product__form.cleaned_data['unidades']
            expiration_date = product__form.cleaned_data['expiration_date']
            fecha_em = product__form.cleaned_data['fecha_em']
            bar_code = product__form.cleaned_data['bar_code']
            cant_ideal = product__form.cleaned_data['cant_ideal']
            # almacen_idalmacen = models.ForeignKey(Almacen, on_delete=models.CASCADE)
            # ubication_idubication = models.ForeignKey(Ubication, on_delete=models.CASCADE)
            # unidad_idunidad = models.ForeignKey(Unity, on_delete=models.CASCADE)
            # pallet_type_idpallet_type = models.ForeignKey(Pallet_Type, on_delete=models.CASCADE)

            # almacen = forms.ModelChoiceField(queryset=Almacen.objects.all())
            # ubicacion = forms.ModelChoiceField(queryset=Ubication.objects.all())
            # tipo_unidad = forms.ModelChoiceField(queryset=Unity.objects.all())
            # tipo_tarima = forms.ModelChoiceField(queryset=Pallet_Type.objects.all())
            house = product__form.cleaned_data['almacen']
            ubication = product__form.cleaned_data['location']
            unit = product__form.cleaned_data['unit__type']
            pallet = product__form.cleaned_data['pallet__type']
            Product.objects.create(
                material=material,
                description=description,
                ple=ple,
                cajas=cajas,
                unidades=unidades,
                expiration_date=expiration_date,
                fecha_em=fecha_em,
                bar_code=bar_code,
                cant_ideal=cant_ideal,
                almacen_idalmacen=house,
                ubication_idubication=ubication,
                unidad_idunidad=unit,
                pallet_type_idpallet_type=pallet,
            ).save()
            return HttpResponseRedirect('/')
    else:
        product__form = ProductsForm()
    return render(request, 'product_form.html', {'Product_Form': product__form})
