(function () {

    var toTrackArray = [
        { selector: "#link-mailinglist", type: "mailing list" },
        { selector: "#link-mailinglist2", type: "mailing list" },
        { selector: "#link-github", type: "github" },
        { selector: "#link-githubissues", type: "github issues" },
        { selector: "#link-helpout", type: "help out" },
        { selector: "#link-plugins", type: "plugins github" },
        { selector: "#link-websitesource", type: "website source" },
        { selector: "#link-mailinglist", type: "mailing list" },
        { selector: "#link-mailinglist", type: "mailing list" },
        { selector: "#link-otr", type: "otr" },
        { selector: "#link-googleplus", type: "google plus" },
        { selector: "#link-twitter", type: "twitter" },
        { selector: "#robroom-brew", type: "mac-brew" },
        { selector: "#louiecaulfield-macports", type: "mac-ports" },
        { selector: "#cyg-ports", type: "cygwin ports" },
    ]

    var trackClicks = function () {
        toTrackArray.forEach(function (toTrack) {
            document.querySelector(toTrack.selector)
                && document.querySelector(toTrack.selector).addEventListener('click', function () {
                    _gaq.push(['_trackEvent', 'links', 'clicked', toTrack.type])
                })

        })
    };

    if (document.readyState !== 'loading') {
        trackClicks();
    } else {
        document.addEventListener('DOMContentLoaded', trackClicks);
    }

})();