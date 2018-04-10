from django.db import models

# Create your models here.
from django.utils import timezone


class Cliente(models.Model):
    idCliente = models.AutoField(primary_key=True)
    Nombre_cliente = models.CharField(max_length=45)
    Apellido_cliente = models.CharField(max_length=45)
    Telefono_cliente = models.CharField(max_length=45)
    Correo_electronico = models.CharField(max_length=45)
    Otros_datos_cliente = models.TextField()

    def __str__(self):
        return '<Nombre Cliente: {}, Apellido Cliente: {}>'.format(self.Nombre_cliente, self.Apellido_cliente)


class ClasificacionEvento(models.Model):
    idClasificacion_evento = models.AutoField(primary_key=True)
    Clasificacion_evento = models.CharField(max_length=45)

    def __str__(self):
        return '<Clasificacion: {}>'.format(self.Clasificacion_evento)


class Evento(models.Model):
    idEvento = models.AutoField(primary_key=True)
    NombreEvento = models.CharField(max_length=45)
    CodigoEvento = models.CharField(max_length=45)

    def __str__(self):
        return '<Nombre Evento: {}, Codigo Evento: {}>'.format(self.NombreEvento, self.CodigoEvento)


class DetalleEvento(models.Model):
    idDetalle_evento = models.AutoField(primary_key=True)
    FechaInicio = models.DateField(default=timezone.now)
    FechaFin = models.DateField()
    ClasificacionEvento_idClasificacionEvento = models.ForeignKey(ClasificacionEvento, on_delete=models.CASCADE)
    Evento_idEvento = models.ForeignKey(Evento, on_delete=models.CASCADE)


class EventoCliente(models.Model):
    idEventoCliente = models.AutoField(primary_key=True)
    ClienteIdCliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    EventoIdEvento = models.ForeignKey(Evento, on_delete=models.CASCADE)


class Almacen(models.Model):
    idalmacen = models.AutoField(primary_key=True)
    almacen = models.TextField()

    def __str__(self):
        return 'Almacen: {}'.format(self.almacen)


class Ubication(models.Model):
    idubication = models.AutoField(primary_key=True)
    ubication = models.TextField()

    def __str__(self):
        return 'Ubication: {}'.format(self.ubication)


class Unity(models.Model):
    idunity = models.AutoField(primary_key=True)
    unity = models.CharField(max_length=45)

    def __str__(self):
        return 'Tipo de Unidad: {}'.format(self.unity)


class Pallet_Type(models.Model):
    idpallet_type = models.AutoField(primary_key=True)  # type: int
    pallet_type = models.CharField(max_length=45)

    def __str__(self):
        return 'Tipo de Tarima: {}'.format(self.pallet_type)


class Product(models.Model):
    idProduct = models.AutoField(primary_key=True)
    material = models.IntegerField()
    description = models.TextField()
    ple = models.IntegerField()
    cajas = models.IntegerField()
    unidades = models.FloatField()
    expiration_date = models.DateField()
    fecha_em = models.DateField(auto_now_add=True)
    bar_code = models.BigIntegerField()
    cant_ideal = models.BigIntegerField()
    almacen_idalmacen = models.ForeignKey(Almacen, on_delete=models.CASCADE)
    ubication_idubication = models.ForeignKey(Ubication, on_delete=models.CASCADE)
    unidad_idunidad = models.ForeignKey(Unity, on_delete=models.CASCADE)
    pallet_type_idpallet_type = models.ForeignKey(Pallet_Type, on_delete=models.CASCADE)

    def __str__(self):
        return '<Description: {}, Material: {}>'.format(self.description, self.material)


class EventoMaterial(models.Model):
    idEventoMaterial = models.AutoField(primary_key=True)
    cantidad_solicitada = models.BigIntegerField()
    EventoIdEvento = models.ForeignKey(Evento, on_delete=models.CASCADE)
    MaterialIdMaterial = models.ForeignKey(Product, on_delete=models.CASCADE)

    def __str__(self):
        return 'Evento: {}'.format(self.EventoIdEvento)
