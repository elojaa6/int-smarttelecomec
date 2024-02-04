from rasa_sdk import Action, Tracker
from rasa_sdk.events import SlotSet
from rasa_sdk.executor import CollectingDispatcher
from typing import List, Dict, Any, Text
import requests

class ActionInicio(Action):
    def name(self) -> Text:
        return "action_inicio"

    def run(self, dispatcher: CollectingDispatcher, 
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        
        nombre_usuario = tracker.get_slot('nombre_usuario')   
        dispatcher.utter_message(text=f"¡Gracias por proporcionar tu información {nombre_usuario}!. Aqui tienes algunas opciones para empezar")       

        # Realizar una solicitud GET al backend para obtener todas las preguntas y respuestas
        response = requests.get('http://spring-boot-app:8080/api/preguntaRespuesta/obtenerTodasPreguntasRespuestas')
        data = response.json()

        buttons = []  # Lista para almacenar los botones

        for i, item in enumerate(data):
            if i >= 3:  # Limitar a tres botones
                break
            pregunta = item['pregunta']
            intent = pregunta.split(';')[0].strip().replace(" ", "_")
            button_title = pregunta.split(';')[0].strip() 
            buttons.append({"title": button_title, "payload": f"/{intent}"})
     
        # Enviar el mensaje con los botones
        dispatcher.utter_message(buttons=buttons)
        
        return []

