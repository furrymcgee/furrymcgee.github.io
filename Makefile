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
	wiki/databases/SQLite.html \
	wiki/development/Git.html \
	wiki/development/Jenkins.html \
	wiki/development/Maven.html \
	wiki/distribution/Debian.html \
	wiki/distribution/Devuan.html \
	wiki/distribution/SUSE.html \
	wiki/distribution/Samba.html \
	wiki/documentation/AsciiDoc.html \
	wiki/documentation/Make.html \
	wiki/java/Java.html \
	wiki/perl/Perl.html \
	wiki/shell/Bash.html \
	wiki/virtualization/QEMU.html \
	wiki/virtualization/VirtualXPVHD.html \
	wiki/web/Apache.html \
	wiki/xml/XML.html
	cp $^ . 2>&- || cp $< index.html

