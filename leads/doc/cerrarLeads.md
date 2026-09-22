# Documentación API CRM Pilot: Cerrar / Desistir Lead

**Método:** `POST`
**Endpoint:** `/v1/welcomes/close.php`
**Descripción:** Permite registrar el desistimiento o cierre de un Lead en CRM Pilot utilizando su Identificador Único (ID).

---

## 1. Estructura de la Petición

La petición debe enviarse en formato JSON (`application/json`) y requiere que **todos** los campos mencionados (tanto en `data` como en `header`) sean completados obligatoriamente.

### Objeto `data` (Parámetros Principales)

> **NOTA IMPORTANTE:** Para cerrar un Lead, el sistema externo (ERP) debe utilizar el `id` asignado al momento de crear el Lead en CRM PILOT. Se recomienda preservar este valor en su sistema ya que es la **ÚNICA** forma de acceder al registro.

| Parámetro | Obligatorio | Tipo | Ejemplo | Descripción |
| :--- | :---: | :--- | :--- | :--- |
| **id** | Sí | Texto (GUID) | `"5E10E873-E392-49F6-89BD-9A8ABBD6638A"` | Identificador único del Lead sobre el que se realizará la operación de cierre. |
| **desist_status_code**| Sí | Texto | `"5"` | Código numérico del motivo de cierre. (Se obtiene del dato maestro `welcome_desist_status`). |
| **desist_comments** | Sí | Texto | `"Obtuvo una mejor oferta"` | Comentario o justificación para entender la razón detallada del cierre. |

### Objeto `header` (Autenticación y Control)

*A diferencia de otros endpoints, para el cierre de Leads la documentación marca todos los campos del encabezado como obligatorios.*

| Parámetro | Obligatorio | Tipo | Ejemplo | Descripción |
| :--- | :---: | :--- | :--- | :--- |
| **FlowName** | Sí | Texto | `"LEAD_CLOSE_PILOT"` | Nombre descriptivo del servicio. |
| **access_token** | Sí | Texto | `"{{token}}"` | Token válido de autorización. |
| **SequenceId** | Sí | Número | `1` | Número de secuencia de la solicitud. |
| **TimeStamp** | Sí | Timestamp| `1493991052` | Fecha (timestamp) en la que se realiza la solicitud. |
| **TrackingId** | Sí | Texto | `"55A6BCD4..."` | Número de tracking que puede utilizar el cliente para hacer seguimiento. |

---

## 2. Consideraciones de la API

*   **Códigos de Desistimiento:** El valor de `desist_status_code` no es texto libre. Debes enviar el código numérico (como cadena de texto) que corresponda a tus motivos de pérdida configurados en el CRM. Para conocer estos códigos, debes consultar el endpoint de Datos Maestros solicitando el maestro `welcome_desist_status`.
*   **Comentarios Obligatorios:** El campo `desist_comments` es requerido por el sistema para auditar por qué se perdió la oportunidad de venta.

---

## Ejemplo de Payload JSON Listo para Uso

```json
{
    "header": {
        "FlowName": "LEAD_CLOSE_PILOT",
        "SequenceId": 1,
        "TimeStamp": 1726760680,
        "TrackingId": "2B50DDB4-14C5-4249-82AB-049E6E735AA1",
        "access_token": "TU_TOKEN_AQUI"
    },
    "data": {
        "id": "5E10E873-E392-49F6-89BD-9A8ABBD6638A",
        "desist_status_code": "5",
        "desist_comments": "El cliente decidió postergar la compra por motivos financieros."
    }
}