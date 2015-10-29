
library(devtools)
library(roxygen2)
library(ggplot2)
library(RColorBrewer)
library(scales)
library(grid)

#
# plots to test
#

document()
load_all()
set_lytics_theme()

# histogram
qplot(rating, data = movies, weight = votes, geom = "histogram", binwidth = 0.1, main = "Histogram!!")


# categorical (colors)
colors <- as.vector(lytics_colors["darkblue"], lytics_colors["brightblue"],lytics_colors["brightgreen"],lytics_colors["gray"])
qplot(mpg, wt, data = mtcars, colour = factor(cyl)) + scale_colour_manual(values = values)

ggplot(diamonds, aes(clarity, fill = cut)) + geom_bar() + scale_colour_manual(values = values)


# density


# faceted
qplot(mpg, wt, data = mtcars, facets = vs ~ am, col = cyl, main = "Faceted Plot")

# smoother (loess)
smoothed <- ggplot(mtcars, aes(qsec, wt))
smoothed + stat_smooth(method = "loess", size = 1) + geom_point() + ggtitle("Title!")

