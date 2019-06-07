TARGETS=build/temerity.md build/temerity.docx build/temerity.pdf build/temerity.html build/temerity.odt

all: $(TARGETS)

build/%.md: %.md | build
	cat $< | fgrep -v "<!--" | sed '/^\s*$$/d' | awk 'ORS="\n\n"' | fmt --width 60 --uniform-spacing | perl -pe 'chomp if eof' > $@

build/%.docx: %.md | build
	pandoc --output $@ $<

build/%.odt: %.md | build
	pandoc --output $@ $<

build/%.html: %.md | build
	pandoc --to html5 --output $@ $<

build/%.pdf: %.md | build
	pandoc --output $@ $<

build:
	mkdir build

.PHONY: clean

clean:
	rm --force build
