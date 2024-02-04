from typing import Any, Dict, List, Text
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.events import Restarted, SlotSet
import requests
import json
from .action_producto_recomendacion import ProductoRecomendacion

class ActionPdfProducto(Action):
    def name(self) -> Text:
        return "action_pdf_producto"

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
        url = f'http://spring-boot-app:8080/api/producto/obtenerProductoPorNombre/{producto}'
        response = requests.get(url)
        
        if response.status_code == 200:
            data = response.json()

            nombreProducto = data.get("nombreProducto")
            archivosPdf = data.get("archivosPdf", [])

            # Verificar si hay archivos PDF disponibles
            if archivosPdf:
                # Crear botones para cada enlace de PDF
                buttons = []
                for pdf in archivosPdf:
                    pdf_name = pdf.get("name")
                    pdf_url = pdf.get("archivoPdf")

                    # Crear un diccionario que representa un botón
                    button = {
                        "title": f"Manual {pdf_name} de {nombreProducto}",
                        "payload": pdf_url
                    }
                    buttons.append(button)

                # Enviar un mensaje con botones
                dispatcher.utter_button_message(text="Elige un manual para abrir:", buttons=buttons)
            else:
                mensaje = f"No hay enlaces de PDF disponibles para el producto {producto}."
                dispatcher.utter_message(text=mensaje)
        else:
            try:
                ProductoRecomendacion.obtener_recomendaciones(response, dispatcher)
            except json.JSONDecodeError:
                # Si no se puede decodificar la respuesta como JSON, maneja el error según sea necesario
                mensaje = f"No se puede encontrar el manual del producto {producto}. ¿Te gustaría saber sobre otro producto?"
                dispatcher.utter_message(text=mensaje)

        return [Restarted(), SlotSet("producto", None)]



# from typing import Any, Dict, List, Text
# from rasa_sdk import Action, Tracker
# from rasa_sdk.executor import CollectingDispatcher
# from rasa_sdk.events import Restarted
# from rasa_sdk.events import SlotSet
# import requests
# import json
# from .action_producto_recomendacion import ProductoRecomendacion

# class ActionPdfProducto(Action):
#     def name(self) -> Text:
#         return "action_pdf_producto"

#     def run(self, dispatcher: CollectingDispatcher, 
#             tracker: Tracker,
#             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

#         # Obtenemos el slot del producto que el usuario haya ingresado.
#         producto = tracker.get_slot("producto") 

#         if producto is None:
#             # Asegurémonos de manejar las recomendaciones de productos
#             dispatcher.utter_message(text="¡Recomendaciones de productos!")
#             return [Restarted()]

#         producto = producto.upper()
        
#         # Realizar una solicitud GET al backend para buscar el producto por nombre.
#         url = f'http://localhost:8060/api/producto/obtenerProductoPorNombre/{producto}'
#         response = requests.get(url)
        
#         if response.status_code == 200:
#             data = response.json()

#             nombreProducto = data.get("nombreProducto")
#             archivosPdf = data.get("archivosPdf", [])

#             # Verificar si hay archivos PDF disponibles
#             if archivosPdf:
#                 # Enviar un mensaje por cada enlace de PDF
#                 for pdf in archivosPdf:
#                     pdf_name = pdf.get("name")
#                     pdf_url = pdf.get("archivoPdf")

#                     dispatcher.utter_message(
#                         text=f"Puedes abrir el manual {pdf_name} del producto {nombreProducto} haciendo clic en el siguiente enlace: {pdf_url}"
#                     )
#         else:
#             try:
#                 ProductoRecomendacion.obtener_recomendaciones(response, dispatcher)
#             except json.JSONDecodeError:
#                 # Si no se puede decodificar la respuesta como JSON, maneja el error según sea necesario
#                 mensaje = f"No se puede encontrar el manual del producto {producto}. ¿Te gustaría saber sobre otro producto?"
#                 dispatcher.utter_message(text=mensaje)
#         return [Restarted(), SlotSet("producto", None)]

