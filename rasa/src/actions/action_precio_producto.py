from typing import Any, Dict, List, Text
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
import requests
from rasa_sdk.events import SlotSet
import random
from .action_producto_recomendacion import ProductoRecomendacion

class ActionPrecioProducto(Action):
    def name(self) -> Text:
        return "action_precio_producto"

    def run(self, dispatcher: CollectingDispatcher, 
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        # Obtenemos el slot del producto que el usuario haya ingresado.
        producto = tracker.get_slot("producto")

        # Verificar si el slot producto es None
        if producto is None:
            dispatcher.utter_message(text="No se proporcionó un nombre de producto, porfavor proporciona un nombre valido.")
            ProductoRecomendacion.obtener_recomendaciones(dispatcher)
            return [SlotSet("producto", None)]

        producto = producto.upper()

        # Realizar una solicitud GET al backend para buscar el producto por nombre.
        url = f'http://spring-boot-app:8080/api/producto/buscarProducto/{producto}'
        response = requests.get(url)
        
        if response.status_code == 200:
            data = response.json()
            precio_producto = data.get("precioProducto")

            if precio_producto is not None:
                dispatcher.utter_message(text=f"El precio del producto {producto} es de {precio_producto} dólares.")
                dispatcher.utter_message(template="utter_ayuda_adicional_aleatoria")
                return [SlotSet("precio_producto", precio_producto)]

        else:

            ProductoRecomendacion.obtener_recomendaciones(dispatcher)

        return [SlotSet("precio_producto", None)]
