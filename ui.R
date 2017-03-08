
library(shiny)
library(shinythemes)

diab <- read.csv("Diabetes.csv")


shinyUI(fluidPage(theme = shinytheme("superhero"),
  
                  
  titlePanel("Diabetes prediction based on diagnostic measurements"),
  p("The dataset used to create this app is originally from the National 
    Institute of Diabetes and Digestive and Kidney Diseases. All patients 
    are females at least 21 years old of Prima Indian heritage. The app uses a Naive
     Bayes classifier."),
  a("Click here to find more information about the dataset.", href = "https://www.kaggle.com/uciml/pima-indians-diabetes-database"),
  h4("Complete the 8 diagnostic measures in the panel in order to make the prediction:"),
  sidebarLayout(
    sidebarPanel(
      numericInput('preg', label = 'Pregnancies: Number of times pregnant', 0, min = 0, max = 30, step = 1),
      numericInput('gluc', label = 'Glucose: Plasma glucose concentration a 2 hours in an oral glucose tolerance test', 0, min = 0, max = 300, step = 1),
      numericInput('bpres', label = 'Blood Pressure: Diastolic blood pressure (mm Hg)', 0, min = 0, max = 200, step = 1),
      numericInput('sthick', label = 'Skin Thickness: Triceps skin fold thickness (mm)', 0, min = 0, max = 200, step = 1),
      numericInput('insulin', label = 'Insulin: 2-Hour serum insulin (mu U/ml)', 0, min = 0, max = 1000, step = 1),
      numericInput('bmi', label = 'BMI: Body mass index (weight in kg/(height in m)^2', 0, min = 0, max = 200, step = 0.1),
      numericInput('dpf', label = 'Diabetes Pedigree Function', 0, min = 0, max = 10, step = 0.001),
      numericInput('age', label = 'Age', 21, min = 21, max = 100, step = 1),
      submitButton('Submit')
    ),
    mainPanel(
       h4('Do you have diabetes?'),
       h4(tableOutput('text'))
      
    )
  )
)
)
