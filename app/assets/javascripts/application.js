// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require best_in_place
//= require foundation
//= require pagedown_bootstrap
//= require pagedown_init
//= require readmore
//# require turbolinks
//= require_tree .
$(function() {
    $(document).foundation();
});
$(document).ready(function() {
    /* Activating Best In Place */
    jQuery(".best_in_place").best_in_place();
});
$(document).ready(function() {
    $('.anime-synopsis').readmore({
        collapsedHeight: 150,
        speed: 1000,
        heightMargin: 16,
        moreLink: '<a href="#">Read more</a>'
    });
});
$(document).foundation();
$(window).on('load', function() {
    $('.previews-scroll').krakatoa({
        width: '100%',
        height: 'auto',
        autoplay: true,
        arrows: false,
        items: 6,
        loop: true,
        buttons: false,
        duration: 500,
        delay: 3500
    });
});
$(document).ready(function() {
    $('.dropify').dropify();
});
$(document).ready(function() {
    var submitIcon = $('.searchbox-icon');
    var inputBox = $('.searchbox-input');
    var searchBox = $('.searchbox');
    var isOpen = false;
    submitIcon.click(function() {
        if (isOpen == false) {
            searchBox.addClass('searchbox-open');
            inputBox.focus();
            isOpen = true;
        } else {
            searchBox.removeClass('searchbox-open');
            inputBox.focusout();
            isOpen = false;
        }
    });
    submitIcon.mouseup(function() {
        return false;
    });
    searchBox.mouseup(function() {
        return false;
    });
    $(document).mouseup(function() {
        if (isOpen == true) {
            $('.searchbox-icon').css('display', 'block');
            submitIcon.click();
        }
    });
});

function buttonUp() {
    var inputVal = $('.searchbox-input').val();
    inputVal = $.trim(inputVal).length;
    if (inputVal !== 0) {
        $('.searchbox-icon').css('display', 'none');
    } else {
        $('.searchbox-input').val('');
        $('.searchbox-icon').css('display', 'block');
    }
}

$(function(){ $(document).foundation(); });
