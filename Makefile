TARGETS=build/temerity.md build/temerity.docx build/temerity.pdf build/temerity.html

all: $(TARGETS)

build/%.md: %.md | build
	fmt --width 60 --uniform-spacing < $< > $@

build/%.docx: %.md | build
	pandoc -o $@ $<

build/%.html: %.md | build
	pandoc -t html5 -o $@ $<

build/%.pdf: %.md | build
	pandoc -o $@ $<

build:
	mkdir -p build

.PHONY: clean

clean:
	rm -f build
