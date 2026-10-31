SBLG = sblg
LOWDOWN = lowdown
BLOG_POSTS = $(wildcard *.md)

PAGES_OUT = $(PAGES:.xml=.html)
BLOG_POSTS_XML = $(BLOG_POSTS:.md=.xml)
BLOG_POSTS_OUT = $(BLOG_POSTS_XML:.xml=.html)

all: index.html atom.xml index.xml

atom.xml index.xml: $(BLOG_POSTS_XML) atom-template.xml
	$(SBLG) -s rcmdline -o atom.xml -a $(BLOG_POSTS_XML)
	cp atom.xml index.xml

index.html: $(BLOG_POSTS_OUT) blog-index.xml
	$(SBLG) -o $@ -t blog-index.xml $(BLOG_POSTS_OUT)

$(BLOG_POSTS_OUT): $(BLOG_POSTS_XML) blog-post-template.xml
	$(SBLG) -s cmdline -t blog-post-template.xml -L $(BLOG_POSTS_XML)

$(BLOG_POSTS_XML): $(BLOG_POSTS)
	echo "<article id=\"manual\" data-sblg-article=\"1\">"  >$@
	echo " <header>" >>$@
	echo "  <h3>`$(LOWDOWN) -X title $(subst .xml,.md,$@)`</h3>" >>$@
	echo "  <address><a href=\"../../contributors/`lowdown -X authors $(subst .xml,.md,$@)`.html\">`lowdown -X authors $(subst .xml,.md,$@)`</a></address>" >>$@
	echo "  <time datetime=\"`$(LOWDOWN) -X date $(subst .xml,.md,$@) | cut -f1 -dT`\">`lowdown -X date $(subst .xml,.md,$@) | cut -f1 -dT`</time>" >>$@
	echo " </header>" >>$@
	$(LOWDOWN) $(subst .xml,.md,$@) >>$@
	echo "</article>" >>$@

clean:
	rm -f index.html $(BLOG_POSTS_XML) $(BLOG_POSTS_OUT) atom.xml index.xml
