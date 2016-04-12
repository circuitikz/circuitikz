#$PDFLATEX_OPTIONS="-include-directory=doc/latex/circuitikz"

.PHONY: ctan_tmp clean

help:
	@echo ---HELP---
	@echo make manual: compile manual
	@echo make ctan: create zip for ctan-upload

manual:
	#if [! -e doc/latex/circuitikz/circuitikzmanual.tex ]; then cd doc/latex/circuitikz;ln -s circuitikzmanual.ltx circuitikzmanual.tex; fi;
	echo "%DO NOT EDIT THIS AUTOMATICALLY GENERATED FILE!!!">doc/latex/circuitikz/changelog.tex
	pandoc -t latex CHANGELOG.md >> doc/latex/circuitikz/changelog.tex
	cd doc/latex/circuitikz;pdflatex compatibility.tex; pdflatex circuitikzmanual.tex; pdflatex circuitikzmanual.tex
	cd doc/context/third/circuitikz;context /circuitikz-context.tex

clean:
	find doc/latex -not -name "*.tex" -not -name "circuitikzmanual.pdf" -not -name ".gitignore" -type f -delete
	find doc/context -not -name "*.tex" -not -name "circuitikz-context.pdf" -not -name ".gitignore" -type f -delete

ctan:
	rm -rf ctan_tmp
	rm -f circuitikz.zip
	#latex doc
	mkdir -p ctan_tmp/circuitikz/doc/latex/circuitikz
	cp doc/latex/circuitikz/circuitikzmanual.tex ctan_tmp/circuitikz/doc/latex/circuitikz
	cp doc/latex/circuitikz/circuitikzmanual.pdf ctan_tmp/circuitikz/doc/latex/circuitikz
	cp doc/latex/circuitikz/compatibility.tex ctan_tmp/circuitikz/doc/latex/circuitikz
	#context doc
	mkdir -p ctan_tmp/circuitikz/doc/context/third/circuitikz
	cp doc/context/third/circuitikz/circuitikz-context.tex ctan_tmp/circuitikz/doc/context/third/circuitikz
	#generic doc
	mkdir -p ctan_tmp/circuitikz/doc/generic/circuitikz
	cp CHANGELOG.md ctan_tmp/circuitikz/doc/generic/circuitikz
	cp README.md ctan_tmp/circuitikz/doc/generic/circuitikz
	cp README.md ctan_tmp/circuitikz/
	#copy Code
	cp -r tex ctan_tmp/circuitikz/tex
	cd ctan_tmp/circuitikz; zip --from-crlf circuitikz.ctan_tmp.zip -r *
	mv ctan_tmp/circuitikz/circuitikz.ctan_tmp.zip ctan_tmp
	#change dirname!
	cd ctan_tmp;zip --from-crlf circuitikz.zip -r *
	mv ctan_tmp/circuitikz.zip ./
	rm -rf ctan_tmp
