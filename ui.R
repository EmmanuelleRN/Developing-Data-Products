library(shiny)

shinyUI(
  navbarPage("A Shiny Application",
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("The relationship between variables and cases"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Age in years of case " = "age",
                                          "Number of births" = "parity",
                                          "Number of prior induced abortions" = "induced",
                                          "Level of education" = "education",
                                          "Number of prior spontaneous abortions" = "spontaneous",
                                          "Matched set number" = "stratum",
                                          "Stratum number" = "pooled.stratum"
                                        )),
                            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                          ),
                          mainPanel(
                            h3(textOutput("caption")),
                            tabsetPanel(type = "tabs",
                                        tabPanel("BoxPlot", plotOutput("caseBoxPlot")),
                                        tabPanel("Regression model",
                                                 plotOutput("infertPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             
             tabPanel("More Data Detail",
                      h2("Infertility after Spontaneous and Induced Abortion"),
                      hr(),
                      h3("Description"),
                      helpText("This is a matched case-control study dating from before the availability of conditional logistic regression."),
                      h3("Format"),
                      p("A data frame with 248 observations on 8 variables."),
                      p(" [, 1] Education"),
                      p(" [, 2] age   age in years of case "),
                      p(" [, 3] parity   count "),
                      p(" [, 4] number of prior induced abortions 0 = 0, 1 = 1, 2 = 2 or more"),
                      p(" [, 5] case status  1 = case 0 = control "),
                      p(" [, 6] number of prior spontaneous abortions 0 = 0, 1 = 1, 2 = 2 or more "),
                      p(" [, 7] matched set number 	1-83 "),
                      p(" [, 8] stratum number   1-63"),
                      h3("Source"),
                      p("Trichopoulos et al (1976) Br. J. of Obst. and Gynaec. 83, 645–650.")
             ),
             tabPanel("Go back to my Github repository",
                      a("https://github.com/EmmanuelleRN/Developing-Data-Products"),
                      hr(),
                      h2("I hope you like the Shiny App")
             )
  )
)
