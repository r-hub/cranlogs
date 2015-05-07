
all: README.markdown

README.markdown: README.Rmd
	Rscript -e "library(knitr); knit('$<', output = '$@', quiet = TRUE)"
