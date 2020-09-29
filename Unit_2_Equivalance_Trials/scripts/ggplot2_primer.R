###########################################################################
# EH6126: Advanced Clinical Trial Design and Analysis
# Unit 2
# Data analysis tutorial - ggplot primer
###########################################################################


# Example using the graphics packages that comes with base R --------------
# Consider the following...

set.seed(27)

x <- rnorm(1:20) # Numeric
y <- rnorm(1:20) # Numeric 

plot(x, y)

z <- lm(y ~ x) # z is the output of the linear 

# Note that z is an object that contains a lot of information
typeof(z)
str(z)

plot(z)


# ggplot2 is loaded when the tidyverse package is called ------------------

library('tidyverse')

# The key thing to note is that all elements of the plot can be modified

# Let's look at an example data set that comes with ggplot

diamonds <- diamonds

# There are three main elements needed to generate a ggplot graph
# A. The data
# B. The geom function
# C. The mappings

# The first part of building a plot is the data 

plot_a <- ggplot(data = diamonds) # Creates a coordinate system
plot_a # i.e. an empty graph

# The second part is defining the coordinate system;
# - the aesthetics of the data are to be plotted
# - the geoms (geometric objects) that represent the data

plot_b <- plot_a + 
  aes(x = carat, y = price) # In ggplot2 we add layers to develop the plot
plot_b

plot_c <- plot_b +
  geom_point()
plot_c

# Using 'facet_wrap' we can create subplots

plot_c +
  facet_wrap(~ clarity)

# What this means for this weeks tutorial ---------------------------------
# Darren creates the plot "g1"

library('viridis') # Package for adding colour schemes

g1 <- ggplot(data.frame(x = c(-4, 4)), # The data
             aes(x = x)) + # The x-axis values
  
  stat_function(fun = dnorm, # Probability density function for the normal distribution
                args = list(0, 1), # Mean 0 and SD of 1
                geom = "area", # Coloring under density curve
                fill = viridis(1), # What colour to use
                alpha = 0.3) + # Transparency to apply
  
  xlim(c(-4, 4)) + # x-axis limits
  xlab("z") + # x-axis label
  ylab("Density") + # y-axis label
  theme_minimal() + # plot formatting
  
  stat_function(xlim = c(1.96, 4), # Area +1.96 SD from mean to 4 SD from mean
                fun = dnorm, 
                args = list(0, 1), 
                geom = "area", 
                fill = viridis(1)) + # Solid fill, no transparency
  stat_function(xlim = c(-4, -1.96), # Area -1.96 SD from mean to 4 SD from mean
                fun = dnorm, args = list(0, 1), 
                geom = "area", 
                fill = viridis(1)) + # Solid fill, no transparency
  
  geom_errorbarh(aes(x = 0, xmax = 1.96, xmin = -1.96, y = 0.1), # Defining our error bar
                 height = 0.05, 
                 size = 2, 
                 color = viridis(1)) +
  
  geom_point(aes(x = 0, y = 0.1), 
             size = 4, 
             color = viridis(1)) +
  
  ggtitle(paste0("The proportion of the total area in the darker part of the distribution\n for t is ",
                 signif(2 * pnorm(1.96, 0, 1, lower.tail = FALSE), 3)))

# Added treatment effect --------------------------------------------------

g2 <- g1 +
  
  stat_function(fun = dnorm, 
                args = list(2, 1), # This distribution has a mean of 2
                geom = "area", 
                fill = viridis(1, direction = -1), # Defining a different colour
                alpha = 0.3) +
  
  xlim(c(-4, 6)) +
  xlab("z") +
  ylab("Density") +
  theme_minimal() +
  
  stat_function(xlim = c(2 + 1.96, 6), 
                fun = dnorm, 
                args = list(2, 1), 
                geom = "area", 
                fill = viridis(1, direction = -1)) +
  stat_function(xlim = c(-4, -1.96 + 2), 
                fun = dnorm, 
                args = list(2, 1), 
                geom = "area", 
                fill = viridis(1, direction = -1)) +
  
  geom_errorbarh(aes(x = 2, xmax = 2 + 1.96, xmin = 2 + -1.96, y = 0.15), 
                 height = 0.05, 
                 size = 2, 
                 color = viridis(1, direction = -1)) +
  geom_point(aes(x = 2, y = 0.15), 
             size = 4, 
             color = viridis(1, direction = -1)) +
  
  ggtitle("")

g2

