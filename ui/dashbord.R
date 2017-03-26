## Dashboard

tabPanel("Dashboard",

         ## Add CSS files
         includeCSS(path = "./css/AdminLTE.css"),
         includeCSS(path = "./css/shinydashboard.css"),

         fluidRow(
             valueBox(subtitle = "Antall pasienter", value = 10 * 2, icon = icon("group")),
             infoBoxOutput("Box1")),
         br(),
         fluidRow(
             column(4,
                    includeHTML("./txt/indikator01.html")
                    ),
             br(),
             column(4,
                    includeMarkdown("./txt/indikator02.md"))

         ),

         br(),
         hr(),

         fluidRow(
             column(4,
                    withTags(div(class = "panel panel-primary",
                                 div(class = "panel-heading",
                                     div(class = "panel-title",
                                         "Testing title")),
                                 div(class = "panel-body",
                                     "Testing for inholder i panel bla bla
bla bla bla bla
         bla bla bla bla bla bla")))))

)
