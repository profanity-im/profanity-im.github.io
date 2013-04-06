$(document).ready(function () {
    $("#download-zip").click(function (e) {
        var download_version = $(this).attr("href");
       _gaq.push(['_trackEvent', 'downloads', 'clicked', download_version]);
    });

    $("#download-tarball").click(function (e) {
        var download_version = $(this).attr("href");
       _gaq.push(['_trackEvent', 'downloads', 'clicked', download_version]);
    });
});
