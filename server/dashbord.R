## Input for dashbord server

output$Box1 <- renderValueBox({
    valueBox(
        subtitle = "Årskontroll", value = "80", icon = icon("thumbs-up", lib = "glyphicon"),
        color = "yellow"
    )
})
