from rasa_sdk import FormValidationAction
from rasa_sdk.types import DomainDict
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk import Tracker
from typing import Any, Text, Dict
import re


class ValidateFormUsuario(FormValidationAction):
    def name(self) -> Text:
        return "validate_form_usuario"

    def validate_nombre_usuario(
        self,
        value: Text,
        dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: DomainDict,
    ) -> Dict[Text, Any]:
        
        if not value.isalpha():
            dispatcher.utter_message("Por favor, ingrese un nombre válido.")
            return {"nombre_usuario": None}
        return {"nombre_usuario": value}
    

    def validate_correo_usuario(
        self,
        value: Text,
        dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: DomainDict,
    ) -> Dict[Text, Any]:
        if not re.match(r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$", value):
            dispatcher.utter_message("Por favor, ingrese un correo válido.")
            return {"correo_usuario": None}
        return {"correo_usuario": value}



    def validate_telefono_usuario(
        self,
        value: Text,
        dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: DomainDict,
    ) -> Dict[Text, Any]:
        
        if not value:
            dispatcher.utter_message("Por favor, ingrese un teléfono válido.")
            return {"telefono_usuario": None}

        # Define un patrón de expresión regular para un número de teléfono
        telefono_pattern = re.compile(r'^\d{10}$')  # Asume un formato de 10 dígitos

        if not telefono_pattern.match(value):
            dispatcher.utter_message("Por favor, ingrese un formato de teléfono válido.")
            return {"telefono_usuario": None}

        return {"telefono_usuario": value}


    def validate_direccion_usuario(
        self,
        value: Text,
        dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: DomainDict,
    ) -> Dict[Text, Any]:
        
        if not value:
            dispatcher.utter_message("Por favor, ingrese una dirección válida.")
            return {"direccion_usuario": None}

        # Define un patrón de expresión regular para caracteres alfabéticos
        direccion_pattern = re.compile(r'^[a-zA-Z\s]+$')  

        if not direccion_pattern.match(value):
            dispatcher.utter_message("Por favor, ingrese una dirección válida con caracteres alfabéticos.")
            return {"direccion_usuario": None}

        return {"direccion_usuario": value}
