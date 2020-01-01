LATEXMK = latexmk
BASE = CV_Michael_Wild
OPTS =

.DEFAULT: all
.PHONY: all help clean realclean en de EN DE \
        watch watch/en watch/de \
        view view/en view/de

all: en de
en: EN
de: DE

EN DE:
	$(LATEXMK) $(OPTS) $(BASE)_$@.tex

view/en view/de: OPTS=-pv
view/en: en
view/de: de

view: view/en view/de

watch/en watch/de: OPTS=-pvc
watch/en: en
watch/de: de

watch:
	$(MAKE) -j watch/en watch/de

clean:
	$(LATEXMK) -c

realclean:
	$(LATEXMK) -C

help:
	@echo "Targets:\n\
	  all       Build English and German CV\n\
	  view      Build English and German CV and preview\n\
	  watch     Continuously watch and build English and German CV with previews\n\
	  en        Build English CV\n\
	  de        Build German CV\n\
	  view/en   Build English CV and preview\n\
	  view/de   Build German CV and preview\n\
	  watch/en  Continuously watch and build English CV with preview\n\
	  watch/de  Continuously watch and build German CV with preview\n\
	  clean     Remove intermediate files but leave output files\n\
	  realclean Remove intermediate and output files"
