"""inventario URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from full_inventory import views

urlpatterns = [
    path('', views.index, name='index'),
    path('Products/<int:pk>', views.product_detail, name='product_detail'),
    path('Products/product_add', views.product_add, name='product_add'),
    path('Products/product_delete', views.product_delete, name='product_delete'),
    path('admin/', admin.site.urls),
]
