Sources for https://profanity-im.github.io

Most site are edited by hand.

Top level pages are generated from xml sources using [sblg](https://kristaps.bsd.lv/sblg/).
The source file for the landing page is index.xml which contains html for everything other
than the header and footer.  The source files for other top level pages are in the folder
`pagesource`. These are xml files which contain html content for everything other than the
header and footer. Edit them by hand.

Blog entry sources are in the directory `blogsource/content/post`. These are markdown
files which are processed by [lowdown](https://kristaps.bsd.lv/lowdown). To create a new
blog entry enter the directory `blogsource`. Run `blog-post.sh` to create a blog post
starter file. Edit the starter file created in `blogsource/content/post/` to add the
content for the blog post. If you do not have a contributor profile, please create one in
`blogsource/content/contributors`. See one of the existing contributor profiles for the
formatting. Optionally add an image in jpeg format with name `username.jpg` to be used with
your profile in `blogsource/content/contributors/img`.

Command references (main_fragment.html, toc_fragment.html),  and apidocs are generated via
`profanity docgen`. See the
[release guide](https://github.com/profanity-im/profanity/blob/master/RELEASE_GUIDE.md) for
details.

GitHubActions will build and deploy the website for updates to blog entries and to changes in
the top level pages.

To build the site locally, type `make` in the top level directory.  You will need to have
[sblg](https://kristaps.bsd.lv/sblg/) and [lowdown](https://kristaps/bsd.lv/lowdown) installed
on your system.
