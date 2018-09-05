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

.DEFAULT_GOAL:=index.html

wiki/documentation/AsciiDoc.html: wiki/Wiki.256.png

index.html: README.html \
	wiki/Wiki.html \
	wiki/documentation/AsciiDoc.html \
	wiki/git/Git.html \
	wiki/shell/Bash.html \
	wiki/debian/Debian.html \
	wiki/qemu/QEMU.html \
	wiki/qemu/VirtualXPVHD.html \
	wiki/perl/Perl.html
	cp $^ . 2>&- || cp $< index.html

