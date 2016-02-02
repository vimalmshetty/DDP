#ui.R
library(shiny)
library(ggplot2)

trainData <- read.csv("./data/train.csv")

dataset <- trainData


shinyUI(fluidPage(
	navbarPage("Titanic: Machine Learning from Disaster? (Kaggle)"
		# navbarMenu("Links ",
  #   		tabPanel$a(href = "https://www.kaggle.com/c/titanic-gettingStarted", "Kaggle Titanic Challenge"),
  #   		tabPanel("Table")
  #   	)
	),
	titlePanel("Developing Data Products - Coursera"),
	sidebarLayout(
	 sidebarPanel(
		
		h3('Inputs for the Plot'),

		sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
				value=min(500, nrow(dataset)), step=100, round=0),
		selectInput('x', 'X - Axis', names(dataset), selected = "Age"),
		selectInput('y', 'Y - Axis', names(dataset), selected = "Pclass"),
		selectInput('color', 'Color - Based on', selected = "Sex" , c('None', names(dataset))),

		checkboxInput('jitter', 'Jitter'),
		checkboxInput('smooth', 'Smooth'),

    	selectInput('facet_row', 'Facet Row', selected = "Survived", c(None='.', names(dataset))),
    	selectInput('facet_col', 'Facet Column', c(None='.', names(dataset))),
    	downloadButton('downloadData', 'Download Train set'),
    	tags$br()
			 
			 ),
	
	 mainPanel(
	  p('Please note that in this experiment I will be using the data set available under Kaggle Challenge - Titanic: Machine Learning from Disaster?'),
		p("I the training dataset, which you can download here, or on Kaggle's page:"),
		a("https://www.kaggle.com/c/titanic-gettingStarted"),
		#img(src ="./figures/titanic.png", height = 200, width = 200),
		p('It is inspired on Trevor Stephens R tutorial, which I highly recommend if you are getting started to R:'),
		a('http://trevorstephens.com/post/72916401642/titanic-getting-started-with-r'),
		h4('Getting Started with this Web App'),
		p('On the side panel you can change the variables that are injected to the plot (from ggplot2 library).'),
		p('You can change which variable go the the X-axis, Y-axis, color by variable, and include jitter, smooth, and row/column facets.'),
		p('Use it to your advantage in order to extract the maximum logic conclusions out of the plot for latter implementation of Machine Learning Algorithms.'),
		strong('About the plot'),
		p('The plot has already some variables choosen by default, to help you interprete the data.'),
		p('From the default settings, the plot is intended to allow the comparison among some variables:'),
		tags$ul(
			tags$li('Compare the sex of the Survivors. Any prevaling?'),
			tags$li('Compare the classes of Passengers. Any class with more survivors?'),
			tags$li('Compare age of Passengers. Any prevaling?')
		),
		
		plotOutput('plot')

	 )
	)
))