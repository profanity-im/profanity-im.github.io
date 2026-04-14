SBLG = sblg
XSLTPROC = xsltproc
LOWDOWN = lowdown
PREFIX = $(PWD)/site
BLOG_SRC_TOP_DIR = blogsource/content
BLOG_POST_SRC_DIR = $(BLOG_SRC_TOP_DIR)/post
BLOG_POST_OUT_TOP_DIR = blog
BLOG_POST_OUT_DIR = $(BLOG_POST_OUT_TOP_DIR)/post
BLOG_POSTS = $(wildcard $(BLOG_POST_SRC_DIR)/*.md)
BLOG_POSTS_OUT = $(subst $(BLOG_POST_SRC_DIR), $(BLOG_POST_OUT_DIR), $(BLOG_POSTS:.md=.html))
CONTRIBUTORS_SRC_DIR = blogsource/content/contributors
CONTRIBUTORS_OUT_DIR = contributors
CONTRIBUTORS = $(wildcard $(CONTRIBUTORS_SRC_DIR)/*.md)
PAGES_SRC_DIR = pagesource
PAGES_SRC = $(wildcard $(PAGES_SRC_DIR)/*.md)
PAGES_MD_TO_XML = $(subst $(PAGES_SRC_DIR)/,,$(PAGES_SRC:.md=.xml))
PAGES_XML = $(PAGES_MD_TO_XML)
PAGES_XML += xeps.xml
PAGES = $(PAGES_XML:.xml=.html)
REDIRECTS_DIR = pageredirects
REDIRECTS_SRC = $(wildcard $(REDIRECTS_DIR)/*.html)
REDIRECTS = $(subst $(REDIRECTS_DIR)/,,$(REDIRECTS_SRC))

VERSION = $(shell cat profanity_version.txt)
TAR_XZ_SHA256 = $(shell sha256sum tarballs/profanity-$(VERSION).tar.xz | cut -d' ' -f1)
ZIP_SHA256 = $(shell sha256sum tarballs/profanity-$(VERSION).zip | cut -d' ' -f1)

all: index.html $(PAGES) themegallery.html $(BLOG_POSTS_OUT) $(BLOG_POST_OUT_DIR)/atom.xml \
     $(BLOG_POST_OUT_DIR)/index.html $(CONTRIBUTORS_OUT) $(CONTRIBUTORS_OUT_DIR)/index.html $(REDIRECTS)

install:  index.html $(PAGES) themegallery.html $(BLOG_POSTS_OUT) $(BLOG_POST_OUT_DIR)/atom.xml \
	$(BLOG_POST_OUT_DIR)/index.html $(CONTRIBUTORS_OUT) $(CONTRIBUTORS_OUT_DIR)/index.html $(REDIRECTS)
	mkdir -p $(PREFIX)
	install -m0444 *.html $(PREFIX)
	install -m0444 -p -D -t $(PREFIX)/$(BLOG_POST_OUT_TOP_DIR) $(BLOG_POST_OUT_TOP_DIR)/index.html
	install -m0444 -p -D -t $(PREFIX)/$(BLOG_POST_OUT_DIR) $(BLOG_POST_OUT_DIR)/*.html
	install -m0444 -p -D -t $(PREFIX)/$(BLOG_POST_OUT_DIR)/img $(BLOG_POST_OUT_DIR)/img/*.png
	install -m0444 -p -D -t $(PREFIX)/$(CONTRIBUTORS_OUT_DIR) $(CONTRIBUTORS_OUT_DIR)/*.html
	install -m0444 -p -D -t $(PREFIX)/$(CONTRIBUTORS_OUT_DIR)/img $(CONTRIBUTORS_OUT_DIR)/img/*jpg
	cp -p -r css $(PREFIX)
	cp -p -r guide $(PREFIX)
	cp -p -r images $(PREFIX)
	cp -p -r js $(PREFIX)
	cp -p -r plugins $(PREFIX)
	cp -p -r tarballs $(PREFIX)


index.html: landing-template.xml index.md profanity_version.txt
	sed -e 's/$${version}/$(VERSION)/g' \
	    -e 's/$${tar_xz_sha256}/$(TAR_XZ_SHA256)/g' \
	    -e 's/$${zip_sha256}/$(ZIP_SHA256)/g' index.md > index.tmpmd
	echo "<article data-sblg-article=\"1\" data-sblg-set-title=\"Profanity, a console based XMPP client - Home\" data-sblg-set-subtitle=\"A console based XMPP client\">"  >$(@:.html=.xml)
	$(LOWDOWN) --html-no-head-ids  --html-no-skiphtml --html-no-escapehtml index.tmpmd >>$(@:.html=.xml)
	echo "</article>" >>$(@:.html=.xml)
	sed -e 's|<p>$${div_content}</p>|<div id="content">|g' $(@:.html=.xml) > $(@:.html=.tmpxml)
	sed -e 's|<p>$${div_features}</p>|<div id="features">|g' $(@:.html=.tmpxml) > $(@:.html=.xml)
	sed -e 's|<p>$${div_screenshots}</p>|<div id="screenshots">|g' $(@:.html=.xml) > $(@:.html=.tmpxml)
	sed -e 's|<p>$${div_end}</p>|</div>|g' $(@:.html=.tmpxml) > $(@:.html=.xml)
	$(SBLG) -o $@ -t landing-template.xml -c index.xml
	rm -f index.xml index.tmpxml index.tmpmd

$(PAGES): manual-template.xml $(PAGES_MD_TO_XML) xeplist
	$(SBLG) -o $@ -t manual-template.xml -c $(@:.html=.xml)
	rm -f $(@:.html=.xml)

$(PAGES_MD_TO_XML): $(PAGES_SRC)
	cp $(addprefix $(PAGES_SRC_DIR)/,$(@:.xml=.md)) .
	echo "<article id=\"manual\" data-sblg-article=\"1\" data-sblg-set-title=\"`$(LOWDOWN) -X title $(@:.xml=.md)`\" data-sblg-set-subtitle=\"`$(LOWDOWN) -X subtitle $(@:.xml=.md)`\">"  >$@
	$(LOWDOWN) --html-no-skiphtml --html-no-escapehtml $(subst .xml,.md,$@) >>$@
	echo "</article>" >>$@
	sed -e 's|<p>$${section_start}</p>|<section>|g' $@ > $(@:.xml=.tmpxml)
	sed -e 's|<p>$${section_end}</p>|</section>|g' $(@:.xml=.tmpxml) > $@
	rm -f $(@:.xml=.md) $(@:.xml=.tmpxml)

xeplist: $(PAGES_SRC_DIR)/doap-stylesheet/style.xsl $(PAGES_SRC_DIR)/doap/profanity.doap \
	$(PAGES_SRC_DIR)/xeplist/xeplist.xml
	cp --preserve=mode,ownership,timestamps $(PAGES_SRC_DIR)/xeplist/xeplist.xml \
		$(PAGES_SRC_DIR)/doap-stylesheet/
	$(XSLTPROC) $(PAGES_SRC_DIR)/doap-stylesheet/style.xsl \
		$(PAGES_SRC_DIR)/doap/profanity.doap \
		> xeps.xml
	rm $(PAGES_SRC_DIR)/doap-stylesheet/xeplist.xml

themegallery.html: gallery-template.xml
	$(SBLG) -o $@ -t gallery-template.xml -c themegallery.xml

$(BLOG_POST_OUT_DIR)/atom.xml $(BLOG_POST_OUT_DIR)/index.html $(BLOG_POSTS_OUT): $(BLOG_POSTS)
	$(MAKE) -C $(BLOG_POST_SRC_DIR)
	mkdir -p $(BLOG_POST_OUT_DIR)
	cp --preserve=mode,ownership,timestamps $(BLOG_SRC_TOP_DIR)/index.html $(BLOG_POST_OUT_TOP_DIR)/
	mv $(BLOG_POST_SRC_DIR)/*.html $(BLOG_POST_OUT_DIR)/
	mv $(BLOG_POST_SRC_DIR)/atom.xml $(BLOG_POST_OUT_DIR)/
	cp --preserve=mode,ownership,timestamps --recursive $(BLOG_POST_SRC_DIR)/img $(BLOG_POST_OUT_DIR)/
	$(MAKE) -C $(BLOG_POST_SRC_DIR) clean

$(CONTRIBUTORS_OUT_DIR)/index.html $(CONTRIBUTORS_OUT): $(CONTRIBUTORS)
	$(MAKE) -C $(CONTRIBUTORS_SRC_DIR)
	mkdir $(CONTRIBUTORS_OUT_DIR)
	mv $(CONTRIBUTORS_SRC_DIR)/*.html $(CONTRIBUTORS_OUT_DIR)/
	cp --preserve=mode,ownership,timestamps --recursive $(CONTRIBUTORS_SRC_DIR)/img $(CONTRIBUTORS_OUT_DIR)/
	$(MAKE) -C $(CONTRIBUTORS_SRC_DIR) clean

$(REDIRECTS): $(REDIRECTS_SRC)
	cp --preserve=mode,ownership,timestamps $(addprefix $(REDIRECTS_DIR)/,$@) .

clean:
	$(MAKE) -C $(BLOG_POST_SRC_DIR) clean
	$(MAKE) -C $(CONTRIBUTORS_SRC_DIR) clean
	rm -f index.html $(PAGES) themegallery.html $(REDIRECTS) $(PAGES_SRC_DIR)/xeps.xml
	rm -r $(BLOG_POSTS_XML) $(BLOG_POSTS_OUT) $(BLOG_POST_OUT_TOP_DIR)
	rm -r $(CONTRIBUTORS_XML) $(CONTRIBUTORS_OUT) $(CONTRIBUTORS_OUT_DIR)
