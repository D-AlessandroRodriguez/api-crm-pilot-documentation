#lead
{
    "crear": {
        "action":"post",
        "url":"/v1/welcomes/create.php",
        "FlowName": "lead_create"
    },
    "leer": {
        "action":"post",
        "url":"/v1/welcomes/read.php",
        "FlowName": "read_prospect"
    },
    "listar_leads":{
        "action":"POST",
        "url":"/v1/welcomes/list.php",
        "FlowName": ["List_leads", "List_Leads"]
    },
    "actualizar_leads":{
        "action":"POST",
        "url":"/v1/welcomes/update.php",
        "FlowName": "update_prospect"
    },
    "cerrar_leads":{
        "action":"POST",
        "url":"/v1/welcomes/close.php",
        "FlowName": “LEAD_CLOSE_PILOT”
    },
    "crear_comentario":{
        "action":"POST",
        "url":"/v1/welcomes/comments/create.php",
        "FlowName": "lead_comment_create"
    }
}

#eventos
{
    "crear_evento":{
        "action":"POST",
        "url":"/v1/welcomes/events/create.php",
        "FlowName": "event_create"
    },
    "listar_eventos":{
        "action":"POST",
        "url":"/v1/welcomes/events/list.php",
        "FlowName": "welcomes_event_list"
    },
    "crear_comentario":{
        "action":"POST",
        "url":"/v1/welcomes/comments/create.php",
        "FlowName": "lead_comment_create"
    }
}
