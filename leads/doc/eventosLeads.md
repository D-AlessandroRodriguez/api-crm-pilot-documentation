# Documentación API CRM Pilot: Gestión de Eventos (Leads)

Esta sección detalla los endpoints para registrar nuevos eventos (interacciones, visitas, notas) en un Lead, y para consultar el historial de eventos asociados.

---

## 1. Crear un Evento
**Método:** `POST`
**Endpoint:** `/v1/welcomes/events/create.php`
**Descripción:** Permite agregar un evento a un Lead. Los eventos pueden ser simples notas de texto o eventos estructurados con información adicional (como geolocalización).

### 1.1 Estructura de la Petición

#### Objeto `data` y `header`

| Parámetro (data) | Obligatorio | Tipo | Descripción |
| :--- | :---: | :--- | :--- |
| **id** | Sí | Texto (GUID) | Identificador único del Lead. |
| **event_type_code** | Sí | Texto | Código del tipo de evento (ej. `47`: Contacto a Representante, `49`: Solicitud Test Drive). |
| **comment** | Sí | Texto / JSON | Contenido del evento (Máx. 3000 caracteres). *Ver sección 1.2 para detalles.* |
| **FlowName (header)**| Sí | Texto | `"event_create"` |

---

### 1.2 Entendiendo el campo `comment` y la Geolocalización (`map`)

El campo `"comment"` es especial porque acepta **dos formas** de enviar datos, dependiendo de lo que necesites hacer:

**Opción A: Texto Simple**
Si solo quieres dejar una nota, pasas un texto directo:
`"comment": "El cliente llamó para preguntar por el precio."`

**Opción B: Evento Estructurado con Componente Mapa (`map`)**
Si necesitas registrar **dónde** ocurrió el evento (por ejemplo, el cliente hizo un Test Drive o visitaste su empresa), Pilot permite enviar un objeto JSON dentro de `"comment"`. El CRM leerá estas coordenadas y mostrará visualmente un mapa en el historial del cliente.

Para hacer esto, el objeto `"comment"` debe dividirse en dos partes:
1.  **`comment`**: Contiene el texto y si deseas resaltarlo (`"relevance": "hight"`).
2.  **`components`**: Un arreglo donde agregas el mapa indicando latitud y longitud.

#### Estructura del Componente Mapa:
*   `type`: Siempre debe decir `"map"`.
*   `lat`: Latitud en formato numérico (requerido).
*   `long`: Longitud en formato numérico (requerido).

### 1.3 Ejemplo de Payload: Evento con Mapa (Geolocalizado)

En este ejemplo, en lugar de mandar un texto simple, mandamos la estructura JSON dentro de `comment` para que el CRM dibuje el mapa en las coordenadas de Buenos Aires (-34.67, -58.35).

```json
{
    "header": {
        "FlowName": "event_create",
        "SequenceId": 1,
        "TimeStamp": 1726760680,
        "TrackingId": "2B50DDB4-14C5-4249-82AB-049E6E735AA1",
        "access_token": "TU_TOKEN_AQUI"
    },
    "data": {
        "id": "D3263CCF-F425-4F6E-AD87-6DEFD1834523",
        "event_type_code": "50",
        "comment": {
            "comment": {
                "text": "Se realizó un Test Drive en la sucursal central.",
                "relevance": "hight" 
            },
            "components": [
                {
                    "type": "map",
                    "lat": -34.676398,
                    "long": -58.35387
                }
            ]
        }
    }
}
```
## Listar Eventos

**Método:** `POST`
**Endpoint:** `/v1/welcomes/events/list.php`
**Descripción:** Permite listar los eventos vinculados a un Lead específico, soportando paginación y filtros.

### 2.1 Estructura de la Petición

> **⚠️ PELIGRO:** Si omites el parámetro `id` en el bloque `data`, la API retornará masivamente los eventos de **todos** los leads del sistema. Siempre incluye el ID si buscas un cliente en específico.

#### Objeto `data` y `header`

| Parámetro | Obligatorio | Tipo | Descripción |
| :--- | :---: | :--- | :--- |
| **id** (data) | No | Texto (GUID) | Identificador del Lead del cual se quieren obtener los eventos. |
| **filter** (data) | No | Arreglo | Filtros disponibles: `welcome_event_code` (código de evento), `welcome_event_dt` (fecha, ej. `2019-04-30T14:43:25`). |
| **sort** (data) | No | Arreglo | Ordenamiento. Campos permitidos: `welcome_event_dt`, `welcome_event_code`. |
| **limit / page** (data) | No | Número | Paginación (`limit` por defecto: 25, máximo: 100). |
| **FlowName** (header) | Sí | Texto | `"welcomes_event_list"` |

### 2.2 Ejemplo de Payload JSON (Listar Eventos)

Este ejemplo busca los últimos 50 eventos de un Lead específico, filtrando solo un tipo de evento (`46`) y ordenándolos del más reciente al más antiguo.

```json
{
    "header": {
        "FlowName": "welcomes_event_list",
        "SequenceId": 1,
        "TimeStamp": 1726760680,
        "TrackingId": "2B50DDB4-14C5-4249-82AB-049E6E735AA1",
        "access_token": "TU_TOKEN_AQUI"
    },
    "data": {
        "id": "D3263CCF-F425-4F6E-AD87-6DGHF1834523",
        "limit": 50,
        "page": 1,
        "filter": [
            {
                "field": "welcome_event_code",
                "operation": "=",
                "value": "46"
            }
        ],
        "sort": [
            {
                "field": "welcome_event_dt",
                "order": "DESC"
            }
        ]
    }
}