How to add a new theme to the theme gallery:

1. Take a screenshot of the theme and place it in the /images/gallery/themes folder. Make sure the name of the screenshot is like this: (theme name).png
NOTE: when loading a theme make sure to use the command with the `full-load` argument like this: `/theme full-load (theme name)`
We use the `full-load` argument instead of the `load` argument becuase it loads more theme settings.
The `load` argument only loads the colors of the theme. The `full-load` argument loads all of the theme's settings.

2. Add the name of the theme to the ```themeList``` array in ```load_themes.js```.