.PHONY: full html clean
full:
	TEXINPUTS=.:../tex:../doc: lwarpmk cleanall test
	TEXINPUTS=.:../tex:../doc: latexmk -pdf -f -norc test.tex
	TEXINPUTS=.:../tex:../doc: lwarpmk html test
	TEXINPUTS=.:../tex:../doc: lwarpmk limages test

html:
	TEXINPUTS=.:../tex:../doc: lwarpmk html1 # force redo
	TEXINPUTS=.:../tex:../doc: lwarpmk limages

index:
	TEXINPUTS=.:../tex:../doc: lwarpmk html1 # force redo
	TEXINPUTS=.:../tex:../doc: lwarpmk htmlindex
	TEXINPUTS=.:../tex:../doc: lwarpmk html1 # force redo
	TEXINPUTS=.:../tex:../doc: lwarpmk limages

