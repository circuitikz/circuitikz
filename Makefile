$PDFLATEX_OPTIONS="-include-directory=doc/latex/circuitikz"

.PHONY: tds clean

manual: clean
	#if [! -e doc/latex/circuitikz/circuitikzmanual.tex ]; then cd doc/latex/circuitikz;ln -s circuitikzmanual.ltx circuitikzmanual.tex; fi;
	cd doc/latex/circuitikz;pdflatex compatibility.tex; pdflatex circuitikzmanual.tex; pdflatex circuitikzmanual.tex
	cd doc/context/third/circuitikz;context /circuitikz-context.tex

clean:
	find doc/latex -not -name "*.tex" -not -name "circuitikzmanual.pdf" -not -name ".gitignore" -type f -delete
	find doc/context -not -name "*.tex" -not -name "circuitikz-context.pdf" -not -name ".gitignore" -type f -delete

tds: clean manual
	rm -rf tds
	rm circuitikz.zip
	#latex doc
	mkdir -p tds/doc/latex/circuitikz
	cp doc/latex/circuitikz/circuitikzmanual.tex tds/doc/latex/circuitikz
	cp doc/latex/circuitikz/circuitikzmanual.pdf tds/doc/latex/circuitikz
	cp doc/latex/circuitikz/compatibility.tex tds/doc/latex/circuitikz
	#context doc
	mkdir -p tds/doc/context/third/circuitikz
	cp doc/context/third/circuitikz/circuitikz-context.tex tds/doc/context/third/circuitikz
	#generic doc
	mkdir -p tds/doc/generic/circuitikz
	cp doc/generic/circuitikz/CHANGELOG.md tds/doc/generic/circuitikz
	cp README.md tds/doc/generic/circuitikz
	#copy Code
	cp -r tex tds/tex
	cd tds; zip circuitikz.tds.zip -r *
	#change dirname!
	mv tds circuitikz
	zip circuitikz.zip -r circuitikz/*
	mv circuitikz tds
	rm -rf tds



