
%.html: %.asciidoc
	asciidoc -adata-uri -aicondir=$PWD $<


%.png: %.html
	wkhtmltoimage $< $@


%.256.png: %.png
	convert $< -scale 256 $@

.PHONY: clean
clean:
	find -name '*.png' -delete -o -name '*.html' -delete

.DEFAULT_GOAL:=index.html

wiki/documentation/AsciiDoc.html: wiki/Home.256.png

index.html: wiki/documentation/AsciiDoc.html
	mv $< $@

