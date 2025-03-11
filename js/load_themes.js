let gallery = document.getElementById("gallery");
function loadTheme(name) {
    let themeHeader = document.createElement('h3');
    themeHeader.className = "theme-header";
    themeHeader.appendChild(document.createTextNode(name));

    let themeImage = document.createElement('img');
    themeImage.className = "theme-image";
    themeImage.src = "./images/gallery/themes/" + name + ".png";

    let themeContainer = document.createElement('div');
    themeContainer.appendChild(themeHeader);
    themeContainer.appendChild(themeImage);
    gallery.appendChild(themeContainer);
}

const themeList = [
    "aqua",
    "batman",
    "bios",
    "boothj5",
    "complex",
    "forest",
    "gruvbox",
    "gruvbox_transparent",
    "hacker",
    "headache",
    "irssi",
    "joker",
    "jubalian",
    "mono",
    "orange",
    "original",
    "original_bright",
    "shade",
    "simple",
    "snikket",
    "solarized-dark",
    "solarized-light",
    "spawn",
    "whiteness"
];

for (let i = 0; i < themeList.length; i++) {
    loadTheme(themeList[i]);
}