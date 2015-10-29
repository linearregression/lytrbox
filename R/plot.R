#' @export
lytics_colors <- c(
	"white"       = "#FFFFFF",
	"darkblue"    = "#262d37",
	"brightblue"  = "#0093d0",
	"brightgreen" = "#39B43F",
	"gray"        = "#ACB8BC",
	"subnav"      = "#313842"
)

#' Lytics ggplot2 theme
#'
#' \code{lytics_theme} is a ggplot2 theme based on internal Lytics styleguides.
#'
#' The theme can be added to any ggplot plot
#'
#' @examples
#' qplot(...) + lytics_theme()
#'
#' @export

lytics_theme <- function() {
	library(ggplot2)

	# Generate the colors for the chart procedurally with RColorBrewer

	brightblue_palette <- colorRampPalette(c(lytics_colors["white"], lytics_colors["brightblue"]))(9)
	darkblue_palette <- colorRampPalette(c(lytics_colors["brightblue"], lytics_colors["darkblue"]))(9)
	
	color.background = lytics_colors["white"] # palette[2]
	color.grid.major = lytics_colors["gray"] # palette[3]
	color.axis.text = lytics_colors["gray"] # palette[6]
	color.axis.title = darkblue_palette[7]
	color.title = lytics_colors["darkblue"]

	# Begin construction of chart
	theme_bw(base_size = 12) +

	# use proxima nova
	theme(text = element_text(family = "Proxima Nova")) + 
	theme(plot.title = element_text(size = 18, face = "bold")) +

	# Set the entire chart region to a light gray color
	theme(panel.background = element_rect(fill = color.background, color = color.background)) +
	theme(plot.background = element_rect(fill = color.background, color = color.background)) +
	theme(legend.background = element_rect(fill = color.background, color = color.background)) +
	theme(panel.border = element_rect(color = color.background)) +
	theme(strip.background = element_rect(colour = color.background, fill = brightblue_palette[5])) +

	# Format the grid
	theme(panel.grid.major = element_line(color = paste(color.grid.major, "66", sep = ""), size = 0.3)) +
	theme(panel.grid.minor = element_line(color = paste(color.grid.major, "33", sep = ""), size = 0.15)) +
	#theme(panel.grid.minor = element_blank()) +
	theme(axis.ticks = element_blank()) +

	# Format the legend, but hide by default
	theme(legend.background = element_rect(fill = color.background, color = color.background)) +
	theme(legend.key = element_rect(fill = color.background, color = color.background)) +
	theme(legend.text = element_text(size = 7,color = color.axis.title)) +

	# default lines to bright blue
	theme(line = element_line(colour = lytics_colors["brightgreen"], size = 2)) + 
	theme(rect = element_rect(fill = lytics_colors["brightblue"])) + 

	# Set title and axis labels, and format these and tick marks
	theme(plot.title = element_text(color = color.title, vjust = 5)) +
	theme(axis.text.x = element_text(size = 10,color = color.axis.text)) +
	theme(axis.text.y = element_text(size = 10,color = color.axis.text)) +
	theme(axis.title.x = element_text(size = 14,color = color.axis.title, vjust = -1.0)) +
	theme(axis.title.y = element_text(size = 14,color = color.axis.title, vjust = 2.0)) +

	# Plot margins
	theme(plot.margin = unit(c(2, 1, 1, 1), "cm"))
}

#' Load the Lytics ggplot2 theme
#'
#' \code{lytics_theme} is a ggplot2 theme based on internal Lytics styleguides.
#'
#' Unfortunately, you can't set aesthetic defaults in ggplot2 themes.
#'
#' @examples
#' set_lytics_theme()
#'
#' @export

set_lytics_theme <- function() {
	# use set the lytrbox::lytics_theme
	theme_set(lytics_theme())

	# some aesthetics can't be specified in a theme :(
	update_geom_defaults("point", list(colour = lytics_colors["darkblue"]))
	update_geom_defaults("bar", list(fill = lytics_colors["brightblue"], alpha = 0.8))
	update_geom_defaults("line", list(fill = lytics_colors["brightblue"]))
	update_geom_defaults("smooth", list(colour = lytics_colors["brightblue"], fill = lytics_colors["gray"], size = 1))
	update_geom_defaults("density", list(colour = lytics_colors["darkblue"], fill = lytics_colors["gray"], size = 1))

	update_stat_defaults("smooth", list(size = 2)) # doesn't work
}