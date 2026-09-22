# Documentación API CRM Pilot: Actualizar Lead

**Método:** `POST`
**Endpoint:** `/v1/welcomes/update.php`
**Descripción:** Se utiliza para actualizar la información de un Lead específico utilizando su Identificador Único (ID) de CRM PILOT.

---

## 1. Estructura de la Petición

La petición debe enviarse en formato JSON (`application/json`) y se compone de los bloques `data` (donde va el ID y los campos a actualizar) y `header`.

### Objeto `data` (Parámetros Principales)

> **NOTA IMPORTANTE:** El parámetro `id` es la **ÚNICA** forma de acceder al Lead en CRM PILOT para actualizarlo. Se recomienda preservar este valor en su sistema local (ERP) al momento de recibirlo vía WebHook.

| Parámetro | Obligatorio | Tipo | Ejemplo | Descripción |
| :--- | :---: | :--- | :--- | :--- |
| **id** | Sí | Texto (GUID) | `"5E10E873-E392-49F6-89BD-9A8ABBD6638A"` | Identificador único del Lead sobre el que se aplica la actualización. |
| **suborigin_code** | No | Texto | `"11"` | Código del suborigen. (Se obtiene del dato maestro `welcome_suborigin`). |
| **contact_type_code** | No | Texto | `"LS"` | Código del tipo de contacto. (Se obtiene del dato maestro `welcome_contact_type`). |
| **business_type_code** | No | Texto | `"convencional"` | Código del tipo de negocio. (Se obtiene del dato maestro `business_type`). |
| **notes** | No | Texto | `"Notas del Lead"` | Notas u observaciones relativas al Lead. |
| **provider_url** | No | Texto | `"http://www.google.com.ar"` | URL de la publicación de origen del lead. |
| **provider_service** | No | Texto | `"Google AR"` | Nombre de la publicación de origen del lead. |
| **interest_level_code**| No | Texto | `"1"` | Código del grado de interés. (Se obtiene del dato maestro `welcome_interest_level`). |
| **product_of_interest**| No | Texto | `"Ford KA"` | Producto de interés del lead. |

### Objeto `header` (Autenticación y Control)

| Parámetro | Obligatorio | Tipo | Ejemplo | Descripción |
| :--- | :---: | :--- | :--- | :--- |
| **FlowName** | Sí | Texto | `"update_prospect"` | Nombre descriptivo del servicio. |
| **access_token** | Sí | Texto | `"{{token}}"` | Token válido de autorización. |
| **SequenceId** | No | Número | `1` | Número de secuencia de la petición. |
| **TimeStamp** | No | Timestamp| `1493991052` | Fecha en la que se realiza la solicitud. |
| **TrackingId** | No | Texto | `"55A6BCD4..."` | Número de seguimiento opcional. |

---

## 2. Consideraciones de la API

*   **Campos Opcionales:** A excepción del `id`, todos los demás campos dentro de `data` son opcionales. Solo necesitas enviar los campos que deseas actualizar; los que omitas mantendrán su valor actual en el CRM.
*   **Datos Maestros:** Varios campos como `suborigin_code` o `business_type_code` requieren valores específicos preconfigurados en tu CRM. Debes consultar los endpoints de "Datos Maestros" (Masterdata) de Pilot para conocer qué códigos numéricos o de texto son válidos para tu instancia.

---

## Ejemplo de Payload JSON Listo para Uso

```json
{
    "header": {
        "FlowName": "update_prospect",
        "SequenceId": 1,
        "TimeStamp": 1726760680,
        "TrackingId": "55A6BCD4-0857-4A86-85FB-09A228B641B4",
        "access_token": "TU_TOKEN_AQUI"
    },
    "data": {
        "id": "5E10E873-E392-49F6-89BD-9A8ABBD6638A",
        "notes": "El cliente solicitó ser contactado por la tarde.",
        "interest_level_code": "2",
        "product_of_interest": "Ford Territory"
    }
}