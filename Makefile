SBLG = sblg
PREFIX = $(PWD)/site
BLOG_SRC_TOP_DIR = blogsource/content
BLOG_POST_SRC_DIR = $(BLOG_SRC_TOP_DIR)/post
BLOG_POST_OUT_TOP_DIR = blog
BLOG_POST_OUT_DIR = $(BLOG_POST_OUT_TOP_DIR)/post
BLOG_POSTS = $(wildcard $(BLOG_POST_SRC_DIR)/*.md)
BLOG_POSTS_OUT = $(subst $(BLOG_POST_SRC_DIR), $(BLOG_POST_OUT_DIR),  $(BLOG_POSTS:.md=.html))
CONTRIBUTORS_SRC_DIR = blogsource/content/contributors
CONTRIBUTORS_OUT_DIR = contributors
CONTRIBUTORS = $(wildcard $(CONTRIBUTORS_SRC_DIR)/*.md)
PAGES_SRC_DIR = pagesource
PAGES_SRC = $(wildcard $(PAGES_SRC_DIR)/*.xml)
PAGES = $(subst $(PAGES_SRC_DIR)/,,$(PAGES_SRC:.xml=.html))
REDIRECTS_DIR = pageredirects
REDIRECTS_SRC = $(wildcard $(REDIRECTS_DIR)/*.html)
REDIRECTS = $(subst $(REDIRECTS_DIR)/,,$(REDIRECTS_SRC))

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


index.html: landing-template.xml
	$(SBLG) -o $@ -t landing-template.xml -c index.xml

$(PAGES): manual-template.xml
	cp --preserve=mode,ownership,timestamps $(addprefix $(PAGES_SRC_DIR)/,$(@:.html=.xml)) .
	$(SBLG) -o $@ -t manual-template.xml -c $(@:.html=.xml)
	rm -f $(PAGES:.html=.xml)

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
	rm -f index.html $(PAGES) themegallery.html $(REDIRECTS)
	rm -r $(BLOG_POSTS_XML) $(BLOG_POSTS_OUT) $(BLOG_POST_OUT_TOP_DIR)
	rm -r $(CONTRIBUTORS_XML) $(CONTRIBUTORS_OUT) $(CONTRIBUTORS_OUT_DIR)
