$(document).ready(function () {
    $("#link-mailinglist").click(function (e) {
        _gaq.push(['_trackEvent', 'links', 'clicked', "mailing list"]);
    });

    $("#link-github").click(function (e) {
        _gaq.push(['_trackEvent', 'links', 'clicked', "github"]);
    });

    $("#link-googleplus").click(function (e) {
        _gaq.push(['_trackEvent', 'links', 'clicked', "google plus"]);
    });

    $("#link-twitter").click(function (e) {
        _gaq.push(['_trackEvent', 'links', 'clicked', "twitter"]);
    });

    $("#robroom-brew").click(function (e) {
        _gaq.push(['_trackEvent', 'links', 'clicked', "mac-brew"]);
    });
});
