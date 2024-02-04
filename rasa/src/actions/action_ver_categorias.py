from typing import Any, Dict, List, Text
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.events import SlotSet
import requests

class ActionVerCategorias(Action):
    def name(self) -> Text:
        return "action_ver_categorias"

    def run(self, dispatcher: CollectingDispatcher, 
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        # Obtener la posición actual del contador desde las ranuras
        contador_categorias = tracker.get_slot("contador_categorias") or 0

        # Realizar una solicitud GET al backend para obtener todas las subcategorías sin productos.
        url = 'http://spring-boot-app:8080/api/subcategoria/obtenerTodasSubcategoriasSinProductos'
        response = requests.get(url)
        
        if response.status_code == 200:
            subcategorias = response.json()
            
            # Filtrar subcategorías que no tienen categoría superior
            categorias_padres = [categoria for categoria in subcategorias if not any(subcategoria['subcategoriaId'] == categoria['subcategoriaId'] for subcategoria in subcategorias if categoria in subcategoria.get("subcategoriasHijas", []))]

            if categorias_padres:
                dispatcher.utter_message("¡Claro! Aquí están algunas categorías para que elijas:")
                dispatcher.utter_message("\n")

                # Mostrar solo las próximas tres categorías según el contador
                for categoria in categorias_padres[contador_categorias:contador_categorias + 3]:
                    nombre_categoria = categoria.get("nombreSubcategoria", "Nombre no disponible")
                    descripcion_categoria = categoria.get("descripcionSubcategoria", "Descripción no disponible")

                    mensaje = f"Categoría: {nombre_categoria}\nDescripción: {descripcion_categoria}"

                    # Añadir botones de opciones
                    buttons = [
                        {"title": f"Ver Productos", "payload": "producto"},
                    ]

                    # Agregar botón "Mostrar subcategorías" solo si hay subcategorías hijas
                    subcategorias_hijas = categoria.get("subcategoriasHijas")
                    if subcategorias_hijas:
                        buttons.append({"title": f"Mostrar subcategorías", "payload": "ver_subcategorias"})

                    # Enviar mensaje con botones
                    dispatcher.utter_message(text=mensaje)
                    dispatcher.utter_button_message(text="Selecciona una opción:", buttons=buttons)

                    dispatcher.utter_message("\n")

                # Actualizar el contador en las ranuras (fuera del bucle for)
                contador_categorias += 3
                return [SlotSet("contador_categorias", contador_categorias)]

            # Si hay más categorías, proporciona la opción "Ver más categorías"
            if contador_categorias < len(categorias_padres):
                dispatcher.utter_message("¿Quieres ver más categorías?")
                dispatcher.utter_message(
                    buttons=[{"title": "Ver más categorías", "payload": "/ver_mas_categorias"}]
                )
            else:
                dispatcher.utter_message("Lo siento, no se encontraron más categorías disponibles.")
        else:
            dispatcher.utter_message("Lo siento, no se pudo obtener la lista de categorías en este momento. Por favor, inténtalo más tarde.")
        
        return [SlotSet("ver_categorias", None)]
