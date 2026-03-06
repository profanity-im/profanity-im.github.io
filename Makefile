SBLG = sblg
PAGES = accounts.xml \
        donate.xml \
        faq.xml \
        helpout.xml \
        issues.xml \
        plugins.xml \
        userguide.xml \
        xeps.xml

PAGES_OUT = $(PAGES:.xml=.html)

all: index.html $(PAGES_OUT) themegallery.html

index.html: landing-template.xml
	$(SBLG) -o $@ -t landing-template.xml -c index.xml

$(PAGES_OUT): manual-template.xml
	 $(SBLG) -o $@ -t manual-template.xml -c $(subst .html,.xml,$@)

themegallery.html: gallery-template.xml
	$(SBLG) -o $@ -t gallery-template.xml -c themegallery.xml

clean:
	rm -f index.html $(PAGES_OUT) themegallery.html
