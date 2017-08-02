$(document).ready(function () {

    var $dropdown_users = $('#dropdown_users');
    var $profileIdInput = $('#profileId');
    var $orderIdInput = $('#profileId');

    var $profileIdText = $('#profileIdValue');
    var $orderIdText = $('#orderIdValue');

    var $successURL = $('#successURL');
    var $successURLInitial = $('#successURL').val();


    $successURL.val($successURLInitial + "?userId=" + $profileIdInput.val());

    $('#dropper').on("click", function(evt) {
        toggleAllUsers();
    });

    function toggleAllUsers() {
        $dropdown_users.toggleClass("show");
    }

    $('.order_picked').on("click", function (evt) {
        var $val = $(this).val();
        $profileIdInput.val($val);
        $profileIdText.html($val);

        toggleAllUsers();
        evt.preventDefault();
    });

});