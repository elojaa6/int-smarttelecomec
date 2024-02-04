from typing import Any, Dict, List, Text
from rasa_sdk import Action, Tracker
from typing import Any, Dict, List, Text
from rasa_sdk.executor import CollectingDispatcher
import requests
import sys
from rasa_sdk.events import SlotSet

class ActionListaProductos(Action):
    def name(self) -> Text:
        return "action_lista_productos"

    def run(self, dispatcher: CollectingDispatcher, 
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        # Realizar una solicitud GET al backend para buscar el producto por nombre.
        url = f'http://spring-boot-app:8080/api/producto/obtenerTodosLosProductos'
        response = requests.get(url)
        
        if response.status_code == 200:

            productos = response.json()
            
            if productos:
                
                dispatcher.utter_message(text = "Aquí tienes el listado de productos: ")
                dispatcher.utter_message(text = " ")

                for producto in productos:

                    nombreProducto = producto.get("nombreProducto", "Nombre no disponible")

                    mensaje = f" \n - {nombreProducto}"

                    dispatcher.utter_message(text = mensaje)
                    dispatcher.utter_message(text = " ")
                
                dispatcher.utter_message(text = "Quieres saber mas informacion sobre algunos de los productos.")

            else:
                dispatcher.utter_message("Lo siento, no se encontraron productos disponibles en este momento.")
        else:
            dispatcher.utter_message("Lo siento, no se pudo obtener la lista de productos en este momento. Por favor, inténtalo más tarde.")
        
        return []
