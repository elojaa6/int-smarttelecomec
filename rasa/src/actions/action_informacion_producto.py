from typing import Any, Dict, List, Text
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.events import SlotSet
import requests
from .action_producto_recomendacion import ProductoRecomendacion
class ActionInformacionProducto(Action):
    def name(self) -> Text:
        return "action_informacion_producto"

    def run(self, dispatcher: CollectingDispatcher, 
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        # Obtener el slot del producto que el usuario haya ingresado.
        producto = tracker.get_slot("producto")

        if producto is None:
            dispatcher.utter_message(text="No se proporcionó un nombre de producto, por favor proporciona un nombre válido.")
            ProductoRecomendacion.obtener_recomendaciones(dispatcher)
            return [SlotSet("precio_producto", None)]

        producto = producto.upper() 

        # Realizar una solicitud GET al backend para buscar el producto por nombre.
        url = f'http://spring-boot-app:8080/api/producto/obtenerProductoPorNombre/{producto}'
        response = requests.get(url)

        if response.status_code == 200:
            data = response.json()
            
            nombre_producto = data.get("nombreProducto")
            descripcion_producto = data.get("descripcionProducto")
            precio_producto = data.get("precioProducto")
            imagenes_producto = data.get("imagenesProductos", [])
            archivos_pdf = data.get("archivosPdf", [])

            mensaje = (
                f"A continuación, se muestra la información del producto {nombre_producto}: \n"
                f"Nombre Producto: {nombre_producto}\n"
                f"Descripción Producto: {descripcion_producto}\n"
                f"Precio Producto: {precio_producto}\n"
            )

            # Agregar información de imágenes
            if imagenes_producto:
                mensaje += "Imágenes del Producto:\n"
                image_urls = [imagen['filePath'] for imagen in imagenes_producto]
                mensaje += "\n".join(image_urls)

                # Agregar información de archivos PDF
                if archivos_pdf:
                    for pdf in archivos_pdf:
                        mensaje_pdf = (
                            f"Nombre PDF: {pdf['name']}\n"
                            f"Abrir {pdf['name']}: {pdf['archivoPdf']}"
                        )
                        dispatcher.utter_message(text=mensaje_pdf)


        else:
            ProductoRecomendacion.obtener_recomendaciones(dispatcher)

        return [SlotSet("informacion_producto",None)]