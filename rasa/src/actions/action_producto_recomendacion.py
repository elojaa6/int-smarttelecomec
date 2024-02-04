from typing import List, Dict, Text, Any
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
import requests
import random
from rasa_sdk.events import SlotSet

class ProductoRecomendacion:

    @staticmethod
    def obtener_recomendaciones(dispatcher: CollectingDispatcher) -> List[Dict[Text, Any]]:

        # Realizar una solicitud GET al backend para traer una lista de productos.
        urlListaProductos = f'http://spring-boot-app:8080/api/producto/obtenerTodosProductosSinImagen'
        responseListaProductos = requests.get(urlListaProductos)

        dataListaProductos = responseListaProductos.json()

        # Obtener nombres de productos
        nombres_productos = [product.get("nombreProducto") for product in dataListaProductos]
        
        # Seleccionar aleatoriamente 4 productos
        productos_aleatorios = random.sample(nombres_productos, min(3, len(nombres_productos)))

        # Crear botones con las recomendaciones de productos
        buttons = [{"title": producto, "payload": f'/{producto}'} for producto in productos_aleatorios]


        mensaje = f"No se encuentra el producto. ¿Te gustaría obtener información sobre otro producto?"
        dispatcher.utter_message(text=mensaje, buttons=buttons)

        return [SlotSet("producto", None)]
