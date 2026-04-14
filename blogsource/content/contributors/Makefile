SBLG = sblg
LOWDOWN = lowdown
CONTRIBUTORS = $(wildcard *.md)
CONTRIBUTORS_XML = $(CONTRIBUTORS:.md=.xml)
CONTRIBUTORS_OUT = $(CONTRIBUTORS_XML:.xml=.html)

all: index.html

$(CONTRIBUTORS_OUT) index.html: $(CONTRIBUTORS_XML) contributor-template.xml contributor-index.xml
	$(SBLG) -s cmdline -t contributor-template.xml -L $(CONTRIBUTORS_XML)
	$(SBLG) -s rcmdline -t contributor-index.xml -o $@ $(CONTRIBUTORS_XML)

$(CONTRIBUTORS_XML): $(CONTRIBUTORS)
	echo "<article id=\"manual\" data-sblg-article=\"1\">"  >$@
	echo " <header>" >>$@
	echo "  <h3>`$(LOWDOWN) -X name $(subst .xml,.md,$@)`</h3>" >>$@
	echo " </header>" >>$@
	test -f img/$(shell $(LOWDOWN) -X name $(subst .xml,.md,$@)).jpg  && \
	echo " <img src=\"img/`$(LOWDOWN) -X name $(subst .xml,.md,$@)`.jpg\" alt=\"Avatar for `$(LOWDOWN) -X name $(subst .xml,.md,$@)`.\"/>" >>$@ || \
	echo No image
	$(LOWDOWN) --html-no-skiphtml --html-no-escapehtml $(subst .xml,.md,$@) >>$@
	echo "</article>" >>$@

clean:
	rm -f index.html $(CONTRIBUTORS_XML) $(CONTRIBUTORS_OUT)
