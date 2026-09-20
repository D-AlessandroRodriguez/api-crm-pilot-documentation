## Estructura básica de una petición en pilot
````{
        "data":{
            {{estructura}}
        },
        "header":{
            "FlowName":"Descripcion del servicio",
            "SequenceId": [],
            "TimeStamp": [],
            "TrackingId": "0CA0836F-7847-4A30-B09A-60DE9606BA04",
            "access_token":"{{token}}"
        }
}
````
nota: Tomar en cuenta que la api tiene 60 respuestas por minuto

Todas las llamadas deben hacerse a la url -> https://api.pilotsolution.net/{metodo-especifico}