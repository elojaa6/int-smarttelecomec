from typing import Text, List, Any, Dict
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.executor import CollectingDispatcher
import requests

class ActionRegistrarUsuario(Action):
    def name(self) -> Text:
        return "action_registrar_usuario"

    def run(self, dispatcher:CollectingDispatcher, 
            tracker: Tracker,
            domain: Dict[Text,Any]) -> List[Dict[Text,Any]]:

        try:

            nombreUsuario = tracker.get_slot("nombre_usuario")
            emailUsuario = tracker.get_slot("correo_usuario")
            telefonoUsuario = tracker.get_slot("telefono_usuario")
            direccionUsuario = tracker.get_slot("direccion_usuario")

            create_usuario_data = {
                "nombreUsuario": nombreUsuario,
                "emailUsuario": emailUsuario,
                "telefonoUsuario": telefonoUsuario,
                "direccionUsuario": direccionUsuario
            }

            url =  'http://spring-boot-app:8080/api/usuario/guardarUsuario'
            requests.post(url,json = create_usuario_data)


        except ValueError as e:
            dispatcher.utter_message(f"Error: {e}")

            