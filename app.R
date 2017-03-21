library('shiny')

ui <- navbarPage(theme = "readable.css",
                 ## tags$head(
                 ##          tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
                 ##      ),

                 title = "Indikatorer for BBQ register",

                 source(file.path("ui", "dashbord.R"), local = TRUE)$value,
                 source(file.path("ui", "sykehus.R"), local = TRUE)$value,
                 source(file.path("ui", "foretak.R"), local = TRUE)$value,
                 source(file.path("ui", "region.R"), local = TRUE)$value

                 )


server <- function(input, output, session) {

    session$onSessionEnded(stopApp)
}

shinyApp(ui = ui, server = server)
