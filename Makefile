LATEXMK = latexmk -pv

.DEFAULT: all
.PHONY: all en de

all: en de

en de:
	cd $@ && $(LATEXMK)
