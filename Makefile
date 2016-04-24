.PHONY: ctan clean

help:
	@echo ---HELP---
	@echo make manual: compile manual
	@echo make ctan: create zip for ctan-upload

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
	cd doc;xelatex compatibility.tex; xelatex circuitikzmanual.tex; xelatex circuitikzmanual.tex
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

