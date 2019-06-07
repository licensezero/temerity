TARGETS=build/temerity.md build/temerity.docx build/temerity.pdf build/temerity.html

all: $(TARGETS)

build/%.md: %.md | build
	fmt --width 60 --uniform-spacing < $< > $@

build/%.docx: %.md | build
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
