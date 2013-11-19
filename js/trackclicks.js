$(document).ready(function () {
    $("#link-mailinglist").click(function (e) {
        _gaq.push(['_trackEvent', 'links', 'clicked', "mailing list"]);
    });

    $("#link-github").click(function (e) {
        _gaq.push(['_trackEvent', 'links', 'clicked', "github"]);
    });

    $("#link-githubissues").click(function (e) {
        _gaq.push(['_trackEvent', 'links', 'clicked', "github issues"]);
    });

    $("#link-helpout").click(function (e) {
        _gaq.push(['_trackEvent', 'links', 'clicked', "help out"]);
    });

    $("#link-websitesource").click(function (e) {
        _gaq.push(['_trackEvent', 'links', 'clicked', "website source"]);
    });

    $("#link-otr").click(function (e) {
        _gaq.push(['_trackEvent', 'links', 'clicked', "otr"]);
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
