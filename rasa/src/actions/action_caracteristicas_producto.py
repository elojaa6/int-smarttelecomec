from typing import Any, Dict, List, Text
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
import requests
import random
from rasa_sdk.events import SlotSet
from .action_producto_recomendacion import ProductoRecomendacion


class ActionCaracteristicasProducto(Action):
    def name(self) -> Text:
        return "action_caracteristicas_producto"

    def run(self, dispatcher: CollectingDispatcher, 
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        # Obtenemos el slot del producto que el usuario haya ingresado.
        producto = tracker.get_slot("producto") 

        if producto is None:
            ProductoRecomendacion.obtener_recomendaciones(dispatcher)
            return [SlotSet("precio_producto", None)]

        producto = producto.upper()

        # Realizar una solicitud GET al backend para buscar el producto por nombre.
        url = f'http://spring-boot-app:8080/api/producto/buscarProducto/{producto}'
        response = requests.get(url)
        
        if response.status_code == 200:
                data = response.json()
                descripcion_producto = data.get("descripcionProducto")

                dispatcher.utter_message(text=f"El producto {producto} tiene las siguientes características:\n{descripcion_producto}\n")
                dispatcher.utter_message(template="utter_ayuda_adicional_aleatoria")

                return [SlotSet("descripcion_producto", descripcion_producto)]
        else:
             
            ProductoRecomendacion.obtener_recomendaciones(dispatcher)



        return [SlotSet("descripcion_producto", None)]

