from django.shortcuts import render
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

