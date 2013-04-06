$(document).ready(function () {
    $("#link-mailinglist").click(function (e) {
       _gaq.push(['_trackEvent', 'links', 'clicked', "mailing list"]);
    });

    $("#link-github").click(function (e) {
       _gaq.push(['_trackEvent', 'links', 'clicked', "github"]);
    });
});
