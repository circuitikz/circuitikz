XELATEXOPTIONS:=-8bit -interaction=nonstopmode
GIT_REV:=$(shell git rev-parse --short HEAD)
GIT_DATE:=$(shell export LC_ALL=C;date +"%Y\/%m\/%d" --date=@`git show -s --format=%ct`)
#GIT_DATE:=$(shell date)
CTIKZ_GIT_FILENAME:=circuitikzgit.sty
CTIKZ_CONTEXT_GIT_FILENAME:=t-circuitikzgit.tex
.PHONY: ctan clean

help:
	@echo ---HELP---
	@echo make manual: compile manual
	@echo make ctan: create zip for ctan-upload

manual-git: flat
	cp $(CTIKZ_GIT_FILENAME) doc/
	#sed should only match first occurence in file, therefore the strange pattern
	sed -i '0,/^\(\\usepackage.*\){circuitikz}\(.*\)/s//\1{circuitikzgit}\2/' doc/circuitikzmanual.tex
	sed -i '0,/^\(\\usepackage.*\){circuitikz}\(.*\)/s//\1{circuitikzgit}\2/' doc/compatibility.tex
	$(MAKE) manual-latex
	sed -i '0,/^\(\\usepackage.*\){circuitikzgit}\(.*\)/s//\1{circuitikz}\2/' doc/circuitikzmanual.tex
	sed -i '0,/^\(\\usepackage.*\){circuitikzgit}\(.*\)/s//\1{circuitikz}\2/' doc/compatibility.tex
	rm -f doc/$(CTIKZ_GIT_FILENAME)
	mv doc/circuitikzmanual.pdf circuitikzmanualgit.pdf

manual: manual-latex manual-context clean

manual-context: changelog
	rm -f doc/circuitikz-context.pdf
	rm -f doc/tmp.pdf
	cd doc;context circuitikz-context.tex
	#optimize for smaller filesize(faktor 2!)--> no benefit at context!
	#gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=doc/tmp.pdf doc/circuitikz-context.pdf
	#mv doc/tmp.pdf doc/circuitikz-context.pdf

manual-latex: changelog
	rm -f doc/circuitikzmanual.pdf
	rm -f doc/tmp.pdf
	#cd doc;pdflatex compatibility.tex; pdflatex circuitikzmanual.tex; pdflatex circuitikzmanual.tex
	#compile with xelatex for smaller filesize!
	cd doc; TEXINPUTS=.:../tex/: xelatex $(XELATEXOPTIONS) compatibility.tex;  TEXINPUTS=.:../tex/: xelatex $(XELATEXOPTIONS) circuitikzmanual.tex;  TEXINPUTS=.:../tex/: xelatex $(XELATEXOPTIONS) circuitikzmanual.tex
	#optimize for smaller filesize(faktor 2!)--> only useful if using pdflatex
	#gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=doc/tmp.pdf doc/circuitikzmanual.pdf
	#mv doc/tmp.pdf doc/circuitikzmanual.pdf

changelog:
	echo "%DO NOT EDIT THIS AUTOMATICALLY GENERATED FILE, run \"make changelog\" at toplevel!!!" > doc/changelog.tex
	pandoc -t latex CHANGELOG.md >> doc/changelog.tex

clean:
	find doc -not -name "*.tex" -not -name "circuitikz*.pdf" -not -name ".gitignore" -type f -delete
	find tex -name "*circ*" -not -name "*.sty" -not -name "*.tex" -type f -delete

ctan: manual clean
	rm -rf ctan_tmp
	rm -f circuitikz.zip
	#latex doc
	mkdir -p ctan_tmp/circuitikz/doc/latex/circuitikz
	cp doc/circuitikzmanual.tex ctan_tmp/circuitikz/doc/latex/circuitikz
	cp doc/changelog.tex ctan_tmp/circuitikz/doc/latex/circuitikz
	cp doc/circuitikzmanual.pdf ctan_tmp/circuitikz/doc/latex/circuitikz
	cp doc/compatibility.tex ctan_tmp/circuitikz/doc/latex/circuitikz
	#context doc
	mkdir -p ctan_tmp/circuitikz/doc/context/third/circuitikz
	cp doc/circuitikz-context.tex ctan_tmp/circuitikz/doc/context/third/circuitikz
	cp doc/circuitikz-context.pdf ctan_tmp/circuitikz/doc/context/third/circuitikz
	#generic doc
	mkdir -p ctan_tmp/circuitikz/doc/generic/circuitikz
	cp CHANGELOG.md ctan_tmp/circuitikz/doc/generic/circuitikz
	cp README.md ctan_tmp/circuitikz/doc/generic/circuitikz
	#copy Code
	#context-files
	mkdir -p ctan_tmp/circuitikz/tex/context/third/circuitikz
	cp tex/t-circuitikz.tex ctan_tmp/circuitikz/tex/context/third/circuitikz
	#latex-files
	mkdir -p ctan_tmp/circuitikz/tex/latex/circuitikz
	cp tex/circuitikz.sty ctan_tmp/circuitikz/tex/latex/circuitikz
	#common files
	mkdir -p ctan_tmp/circuitikz/tex/generic/circuitikz
	cp tex/pgfcirc* ctan_tmp/circuitikz/tex/generic/circuitikz
	#create tds-zip
	cd ctan_tmp/circuitikz; zip --from-crlf circuitikz.tds.zip -r *
	mv ctan_tmp/circuitikz/circuitikz.tds.zip ctan_tmp
	####create final zip
	#simplify file tree
	find ctan_tmp/circuitikz/doc/ -type f -exec mv {} ./ctan_tmp/circuitikz/doc \;
	find ctan_tmp/circuitikz/doc/* -type d -delete
	find ctan_tmp/circuitikz/tex/ -type f -exec mv {} ./ctan_tmp/circuitikz/tex \;
	find ctan_tmp/circuitikz/tex/* -type d -delete
	#move README
	rm ctan_tmp/circuitikz/doc/CHANGELOG.md;#info also in changelog.tex
	mv ctan_tmp/circuitikz/doc/README.md ctan_tmp/circuitikz
	cd ctan_tmp;zip --from-crlf circuitikz.zip -r *
	mv ctan_tmp/circuitikz.zip ./
	rm -rf ctan_tmp

flat:
	perl tools/flatten.pl tex/circuitikz.sty > $(CTIKZ_GIT_FILENAME)
	perl tools/flatten.pl tex/t-circuitikz.tex > $(CTIKZ_CONTEXT_GIT_FILENAME)
	#insert git revision latex version:
	sed -i 's/\\def\\pgfcircversion{.*/\\def\\pgfcircversion\{git:$(GIT_REV)\}/' $(CTIKZ_GIT_FILENAME)
	sed -i 's/\\def\\pgfcircversiondate{.*/\\def\\pgfcircversiondate\{$(GIT_DATE)\}/' $(CTIKZ_GIT_FILENAME)
	sed -i 's/\\ProvidesPackage{circuitikz}.*/\\ProvidesPackage{circuitikzgit}/' $(CTIKZ_GIT_FILENAME)
	sed -i 's/\r$$//g' $(CTIKZ_GIT_FILENAME)
	#insert git revision context version:
	sed -i 's/\\def\\pgfcircversion{.*/\\def\\pgfcircversion\{git:$(GIT_REV)\}/' $(CTIKZ_CONTEXT_GIT_FILENAME)
	sed -i 's/\\def\\pgfcircversiondate{.*/\\def\\pgfcircversiondate\{$(GIT_DATE)\}/' $(CTIKZ_CONTEXT_GIT_FILENAME)
	sed -i 's/\\startmodule\[circuitikz\].*/\\startmodule[circuitikzgit]/' $(CTIKZ_CONTEXT_GIT_FILENAME)
	sed -i 's/\r$$//' $(CTIKZ_CONTEXT_GIT_FILENAME)

