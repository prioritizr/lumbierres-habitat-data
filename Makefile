all: readme data

data:
	R CMD BATCH --no-restore --no-save code/lumbierres-habitat-data.R

clean:
	rm -f results/*.tif

readme:
	R --slave -e "rmarkdown::render('README.Rmd')"

.PHONY: all data readme
