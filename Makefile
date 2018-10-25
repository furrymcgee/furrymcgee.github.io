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
	wiki/cpp/Cpp.html \
	wiki/database/SQLite.html \
	wiki/debian/Debian.html \
	wiki/debian/Devuan.html \
	wiki/debian/Samba.html \
	wiki/documentation/AsciiDoc.html \
	wiki/git/Git.html \
	wiki/java/Java.html \
	wiki/perl/Perl.html \
	wiki/qemu/QEMU.html \
	wiki/qemu/VirtualXPVHD.html \
	wiki/shell/Bash.html \
	wiki/xml/XML.html
	cp $^ . 2>&- || cp $< index.html

