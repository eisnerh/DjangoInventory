from django.shortcuts import render
from .models import Product

# Create your views here.


def index(request):
    # ordena la lista de todos los productos en orden ascendente
    products = Product.objects.order_by('-material').all()
    #
    return render(request, 'index.html', {'products': products})
