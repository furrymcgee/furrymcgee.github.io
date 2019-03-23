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
	wiki/databases/SQLite.html \
	wiki/databases/Samba.html \
	wiki/debian/Debian.html \
	wiki/debian/Devuan.html \
	wiki/debian/GNU.html \
	wiki/debian/Linux.html \
	wiki/debian/SUSE.html \
	wiki/documentation/AsciiDoc.html \
	wiki/documentation/Make.html \
	wiki/programming/Bash.html \
	wiki/programming/C.html \
	wiki/programming/Cpp.html \
	wiki/programming/Java.html \
	wiki/programming/Haskell.html \
	wiki/programming/Perl.html \
	wiki/programming/Qt.html \
	wiki/tools/Git.html \
	wiki/tools/Jenkins.html \
	wiki/tools/Maven.html \
	wiki/qemu/QEMU.html \
	wiki/qemu/VirtualXPVHD.html \
	wiki/web/Apache.html \
	wiki/web/Mojolicious.html \
	wiki/web/Typo3.html \
	wiki/web/XML.html
	cp $^ . 2>&- || cp $< index.html

