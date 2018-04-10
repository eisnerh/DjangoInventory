from django.contrib import admin
from .models import Product, Cliente, ClasificacionEvento, Evento, DetalleEvento, Almacen, Unity, EventoMaterial, \
    Pallet_Type, Ubication

# Register your models here.

admin.site.register(Product)
admin.site.register(Cliente)
admin.site.register(ClasificacionEvento)
admin.site.register(Evento)
admin.site.register(DetalleEvento)
admin.site.register(Almacen)
admin.site.register(Ubication)
admin.site.register(Unity)
admin.site.register(Pallet_Type)
admin.site.register(EventoMaterial)

