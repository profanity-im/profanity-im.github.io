SBLG = sblg
BLOG_POSTS = $(wildcard *.md)

PAGES_OUT = $(PAGES:.xml=.html)
BLOG_POSTS_XML = $(BLOG_POSTS:.md=.xml)
BLOG_POSTS_OUT = $(BLOG_POSTS_XML:.xml=.html)

all: index.html atom.xml

atom.xml: $(BLOG_POSTS_XML) atom-template.xml
	$(SBLG) -s rcmdline -o $@ -a $(BLOG_POSTS_XML)

$(BLOG_POSTS_OUT) index.html: $(BLOG_POSTS_XML) blog-post-template.xml blog-index.xml
	$(SBLG) -s cmdline -t blog-post-template.xml -L $(BLOG_POSTS_XML)
	$(SBLG) -s rcmdline -t blog-index.xml -o $@ $(BLOG_POSTS_XML)

$(BLOG_POSTS_XML): $(BLOG_POSTS)
	echo "<article id=\"manual\" data-sblg-article=\"1\">"  >$@
	echo " <header>" >>$@
	echo "  <h3>`lowdown -X title $(subst .xml,.md,$@)`</h3>" >>$@
	echo "  <address><a href=\"../contributors/`lowdown -X authors $(subst .xml,.md,$@)`.html\">`lowdown -X authors $(subst .xml,.md,$@)`</a></address>" >>$@
	echo "  <time datetime=\"`lowdown -X date $(subst .xml,.md,$@) | cut -f1 -dT`\">`lowdown -X date $(subst .xml,.md,$@) | cut -f1 -dT`</time>" >>$@
	echo " </header>" >>$@
	lowdown  $(subst .xml,.md,$@) >>$@
	echo "</article>" >>$@

clean:
	rm -f index.html $(BLOG_POSTS_XML) $(BLOG_POSTS_OUT) atom.xml
