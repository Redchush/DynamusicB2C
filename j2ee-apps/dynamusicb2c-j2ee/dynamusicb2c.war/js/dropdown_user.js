$(document).ready(function () {

    var $dropdown_users = $('#dropdown_users');
    var $profileIdInput = $('#profileId');
    var $profileIdText = $('#profileIdValue');
    var $successURL = $('#successURL');
    var $successURLInitial = $('#successURL').val();

    $('#dropper').on("click", function(evt) {
        toggleAllUsers();
    });

    function toggleAllUsers() {
        $dropdown_users.toggleClass("show");
    }

    $('.profileId_picked').on("click", function (evt) {
        var $val = $(this).val();
        $profileIdInput.val($val);
        $profileIdText.html($val);
        $successURL.val($successURLInitial + "?userId=" + $val);
        toggleAllUsers();
        evt.preventDefault();
    });

});
