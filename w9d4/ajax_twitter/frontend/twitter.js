const FollowToggle = require("./follow_toggle.js");


$( function() {
    $(".follow-toggle").each( (idx, button) => { 
        new FollowToggle(button);
    });
});






