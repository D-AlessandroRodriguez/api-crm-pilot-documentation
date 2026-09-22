# Documentación API CRM Pilot: Listar Leads

**Método:** `POST`
**Endpoint:** `/v1/welcomes/list.php`
**Descripción:** Permite listar leads mediante la aplicación de filtros y especificar el orden en el cual se necesita que los resultados sean listados.

---

## 1. Estructura de la Petición

La petición debe enviarse en formato JSON (`application/json`) y se compone de dos bloques principales: `data` y `header`.

### Objeto `data` (Parámetros Principales)

| Parámetro | Obligatorio | Tipo | Ejemplo | Descripción |
| :--- | :---: | :--- | :--- | :--- |
| **limit** | Sí | Número | `100` | Cantidad de registros por página. **Máximo 100**. |
| **page** | Sí | Número | `1` | Número de página en curso. **Máximo 50**. |
| **filters** | No | Arreglo | `[{...}]` | Lista de filtros a aplicar. Si hay varios, se unen con lógica `AND`. |
| **sorts** | No | Arreglo | `[{...}]` | Especifica el campo y el sentido de ordenamiento. |
| **wildCard** | No | Texto | `"*"` | Requerido únicamente si se utiliza el operador `LIKE` en los filtros. |

### Objeto `header` (Autenticación y Control)

| Parámetro | Obligatorio | Tipo | Ejemplo | Descripción |
| :--- | :---: | :--- | :--- | :--- |
| **FlowName** | Sí | Texto | `"List_Leads"` | Nombre descriptivo del servicio. |
| **access_token** | Sí | Texto | `"{{token}}"` | Token válido de autorización. |
| **SequenceId** | No | Número | `1` | Número de secuencia. |
| **TimeStamp** | No | Timestamp | `1493991052` | Fecha en la que se realiza la solicitud. |
| **TrackingId** | No | Texto | `"55A6BCD4..."` | Número de seguimiento (UUID). |

---

## 2. Filtros de Selección (`filters`)

Para filtrar, se debe enviar un arreglo de objetos con la estructura: `{"field": "campo", "operation": "operador", "value": "valor"}`.

| Campo | Descripción | Restricción con operador `LIKE` |
| :--- | :--- | :--- |
| **created** | Fecha de creación. Formato UTC (`YYYY-MM-DDThh:mm:ss.000`) | - |
| **updated** | Fecha de modificación. Formato UTC (`YYYY-MM-DDThh:mm:ss.000`) | - |
| **welcome_delay** | Dato vinculado a Mercado Libre | - |
| **welcome_asigned_user_id** | Identificador único del comercial asignado (Guid) | - |
| **welcome_firstname** | Nombre del Lead |  No acepta LIKE |
| **welcome_lastname** | Apellido del Lead |  No acepta LIKE |
| **welcome_phone** | Últimos 8 caracteres del Teléfono |  **Acepta LIKE** |
| **welcome_cellphone** | Últimos 8 caracteres del Celular |  **Acepta LIKE** |
| **welcome_email** | Dirección de email del Lead |  No acepta LIKE |
| **prospect_cuit** | Id Fiscal del Lead | - |
| **status_code** | Estado del Lead | - |
| **welcome_asigned_branch**| Nombre de la Sucursal de registro |  No acepta LIKE |
| **welcome_origin** | Nombre del Agrupador de Origen de datos |  No acepta LIKE |
| **welcome_suborigin** | Nombre del Origen de datos |  No acepta LIKE |
| **prospect_empresa** | Empresa en la que el Lead trabaja |  No acepta LIKE |
| **interest_level_code** | Grado de interés (temperatura) del Lead | - |
| **business_type_code** | Código del Tipo de Negocio | - |
| **welcome_desist_status** | Condición del desistimiento |  No acepta LIKE |
| **seek** | **Búsqueda Global:** El valor declarado busca en todos los campos | - |

### Operadores Permitidos

| Operador | Símbolo / Valor | Notas |
| :--- | :--- | :--- |
| **Igualdad** | `=` | |
| **Distinto a** | `<>` | |
| **Mayor a** | `>` | |
| **Menor a** | `<` | |
| **Mayor - igual a** | `>=` | |
| **Menor - igual a** | `<=` | |
| **LIKE** | `LIKE` | **Requiere** enviar el parámetro `"wildCard": "*"` en la raíz de `data`. |

---

## 3. Ordenamiento (`sorts`)

Para ordenar los resultados, se debe enviar un arreglo con la estructura: `{"field": "campo", "order": "DESC"}`. 

**Sentidos permitidos:** `ASC` (Ascendente) o `DESC` (Descendente).

| Campo Permitido | Descripción |
| :--- | :--- |
| **created** | Fecha de creación del Lead (UTC) |
| **updated** | Fecha de actualización del Lead (UTC) |
| **welcome_origin** | Código de origen del Lead |
| **welcome_asigned_user_id** | Identificador único del comercial asignado (Guid) |

---

## 4. Consideraciones de la API

### Reglas de la Solicitud
*   El límite máximo para el parámetro `limit` es **100**.
*   El límite máximo para el parámetro `page` es **50**.
*   Si se solicita un `page` mayor a 50, la API devuelve el error: *"This API is limited to 100 records per page with a total of 50 pages."*
*   Si se solicita una página que excede el total de registros existentes (ej. pedir la página 2 cuando solo hay 50 registros en total y el límite es 100), la API devuelve un arreglo vacío en lugar de error.
*   Al concatenar múltiples filtros, estos se ejecutan bajo una condición lógica **AND** (se deben cumplir todos).

### Estructura de Retorno (Paginación)
Al listar con éxito, la respuesta incluye los siguientes campos informativos:
*   `Page`: Número de página devuelta.
*   `Page_count`: Cantidad total de páginas existentes.
*   `Rows_count`: Cantidad total de registros en la base de datos que coinciden con los filtros.
*   `Rows_per_page`: Cantidad de registros por página solicitada (el valor de `limit`).
*   `Rows_in_page`: Cantidad de registros reales que vienen en esta página.
*   `Rows_remaining`: Cantidad de registros que quedan en las páginas siguientes.

---

## Ejemplo de Payload JSON Listo para Uso

```json
{
    "header": {
        "FlowName": "List_Leads",
        "SequenceId": 1,
        "TimeStamp": 1726760680,
        "access_token": "TU_TOKEN_AQUI"
    },
    "data": {
        "limit": 25,
        "page": 1,
        "filters": [
            {
                "field": "welcome_cellphone",
                "operation": "LIKE",
                "value": "93579222"
            }
        ],
        "wildCard": "*",
        "sorts": [
            {
                "field": "created",
                "order": "DESC"
            }
        ]
    }
}