(function () {

    //polyfill Internet Explorer
    if (window.NodeList && !NodeList.prototype.forEach) {
        NodeList.prototype.forEach = Array.prototype.forEach;
    }

    const trackDownloads = function () {
        document.querySelectorAll("#download-zip, #download-tarball").forEach(function (node) {
            var download_version = node.href;
            _gaq.push(['_trackEvent', 'downloads', 'clicked', download_version]);
        })
    };

    if (document.readyState !== 'loading') {
        trackDownloads();
    } else {
        document.addEventListener('DOMContentLoaded', trackDownloads);
    }
})();