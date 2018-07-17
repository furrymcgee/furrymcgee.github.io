%.html: %.asciidoc
	asciidoc -adata-uri -aicondir=$PWD $<

%.txt: %.html
	w3m $< > $@

%.png: %.html
	wkhtmltoimage $< $@

%.256.png: %.png
	convert $< -scale 256 $@

.PHONY: clean
clean:
	find \( -name '*.html' -o -name '*.png' -o -name '*.txt' \) -delete 

.DEFAULT_GOAL:=all

wiki/documentation/AsciiDoc.html: wiki/Wiki.256.png

all: README.html \
	wiki/Wiki.html \
	wiki/documentation/AsciiDoc.html \
	wiki/git/Git.html \
	wiki/shell/Bash.html
	mv $< index.html
	mv $^ . 2>&- || true 

