library(shiny)
library(tidyverse)

ui <- fluidPage(
  
  titlePanel("Registro de información para los competidores"),
  basicPage(
    
   
    
    
   
      
     # Seleccionar el coche
     selectInput(inputId =  "select",
                 label =  "Seleccione el vehículo",
                 choices = list("BMW - R3" = 1, 
                                "Mazda 3" = 2, 
                                "Chevrolet Camaro"= 3, 
                                "Renault 4" = 4, 
                                "Volvo 142E" = 5,
                                "Cadillac Fleetwood"=6
                                )

                 ),
    
     textInput(inputId = "Nombre", 
               label = "Ingrese su nombre",
               placeholder = "Escriba aquí su nombre"
               ),
     
     textInput(inputId = "Apellido", 
               label = "Ingrese su apellido",
               placeholder = "Escriba aquí su apellido"
     ),
     
     numericInput(inputId = "Edad", 
               label = "Ingrese su edad",
               step = 10,
               value = 18,
               min = 18
     ),
     
    actionButton("mostrar", "Cargar")  ,
    
    plotOutput("grafica")
    
    
  )
)

server <- function(input, output, session) {
  
  observeEvent(input$mostrar, {
    
    showModal(modalDialog(
      
      footer = modalButton("Cerrar"),
      title = "¡¡Error Fatal!!", "No es posible guardar la información,
      Por favor contacte a Savne SAS o a su administrador."
    ))
  }
    
    
  )
  
  
  output$grafica <- renderPlot({
    
    ggplot(mtcars, aes(x = disp ,y = hp ))+
      ?geom_line(colour = "blue")
    
  })
  
}

shinyApp(ui, server)



