Sources for https://profanity-im.github.io

The website is generated from XML and Markdown sources using [sblg](https://kristaps.bsd.lv/sblg/) and [lowdown](https://kristaps.bsd.lv/lowdown).

## Reference

| To Change... | Edit File(s) | Format |
| :--- | :--- | :--- |
| **Home Page (Landing)** | `index.xml` | XML Fragment |
| **Top-Level Pages** (FAQ, Donate, etc.) | `pagesource/*.xml` | XML Fragment |
| **Blog Posts** | `blogsource/content/post/*.md` | Markdown |
| **Blog User Profiles** | `blogsource/content/contributors/*.md` | Markdown |
| **Site Header/Footer (Home)** | `landing-template.xml` | HTML Template |
| **Site Header/Footer (Manuals)** | `manual-template.xml` | HTML Template |
| **Blog Post Layout** | `blogsource/content/post/blog-post-template.xml` | HTML Template |
| **Theme Gallery Layout** | `gallery-template.xml` | HTML Template |
| **Style** | `css/*.css` | CSS |

### Page Sources
The source files for the landing page (`index.xml`) and other top level pages in `pagesource/` are XML fragments. They contain the HTML content for the body, which is then injected into the appropriate header and footer templates.

### Blog
Blog posts and contributor profiles are written in Markdown.

To create a new blog entry:
1. Enter the directory `blogsource`.
2. Run `./blog-post.sh` to create a starter file in `blogsource/content/post/`.
3. Edit the new `.md` file to add your content.

If you do not have a contributor profile, please create one in `blogsource/content/contributors/` using an existing profile as a template. You can optionally add a JPEG image (named `username.jpg`) to `blogsource/content/contributors/img/`.

### Documentation
Command references (`main_fragment.html`, `toc_fragment.html`) and apidocs are generated via `profanity docgen`. See the [release guide](https://github.com/profanity-im/profanity/blob/master/RELEASE_GUIDE.md) for details.

### Build & Deploy
GitHub Actions will automatically build and deploy the website to GitHub Pages on every push.

To build the site locally, run `make` in the top level directory. You will need `sblg` and `lowdown` installed on your system.

To preview the site locally, run `make install` which will create a directory `site`, open `site/index.html` in a web browser.

To remove the generated files and keep the source files, run `make clean`.

## Release Process

When a new version of Profanity is released:

1. Update the version string in `profanity_version.txt`.
2. Add the new `.tar.xz` and `.zip` source tarballs to the `tarballs/` directory.
3. Generate the documentation for the new version (`profanity docgen` see RELEASE_NOTES.md in the profanity repo) and copy it to a new subdirectory in `guide/`. Add a link to the new guide in `pagesource/userguide.xml`.

Do not manually update the version strings or SHA-256 hashes in `index.html`. These are calculated dynamically from the files during the build process on GitHub Actions.
