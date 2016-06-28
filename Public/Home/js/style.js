$(document).ready(function() {
    $(".example").mouseover(function() {
        $(this).css("-webkit-transform", "scale(1.1, 1.1)");
        $(this).css("-moz-transform", "scale(1.1, 1.1)");
        $(this).css("-o-transform", "scale(1.1, 1.1)");
    });
    $(".example").mouseleave(function() {
        $(this).css("-webkit-transform", "scale(1, 1)");
        $(this).css("-moz-transform", "scale(1, 1)");
        $(this).css("-o-transform", "scale(1, 1)");
    });
    $(".menu").mouseover(function() {
        $(this).children(".overlay").css("top", "0");
        $(this).css("-webkit-transform", "scale(1.1, 1.1)");
        $(this).css("-moz-transform", "scale(1.1, 1.1)");
        $(this).css("-o-transform", "scale(1.1, 1.1)");
    });
    $(".menu").mouseleave(function() {
        $(this).children(".overlay").css("top", "-100%");
        $(this).css("-webkit-transform", "scale(1, 1)");
        $(this).css("-moz-transform", "scale(1, 1)");
        $(this).css("-o-transform", "scale(1, 1)");
    });
    $(".mda").mouseover(function() {
        $(this).css("-webkit-transform", "scale(1.2, 1.2)");
        $(this).css("-moz-transform", "scale(1.2, 1.2)");
        $(this).css("-o-transform", "scale(1.2, 1.2)");
    });
    $(".mda").mouseleave(function() {
        $(this).css("-webkit-transform", "scale(1, 1)");
        $(this).css("-moz-transform", "scale(1, 1)");
        $(this).css("-o-transform", "scale(1, 1)");
    });
    $(".partner").mouseover(function() {
        $(this).css("-webkit-transform", "scale(1.2, 1.2)");
        $(this).css("-moz-transform", "scale(1.2, 1.2)");
        $(this).css("-o-transform", "scale(1.2, 1.2)");
    });
    $(".partner").mouseleave(function() {
        $(this).css("-webkit-transform", "scale(1, 1)");
        $(this).css("-moz-transform", "scale(1, 1)");
        $(this).css("-o-transform", "scale(1, 1)");
    });
    $(".team").mouseover(function() {
        $(this).css("-webkit-transform", "scale(1.2, 1.2)");
        $(this).css("-moz-transform", "scale(1.2, 1.2)");
        $(this).css("-o-transform", "scale(1.2, 1.2)");
    });
    $(".team").mouseleave(function() {
        $(this).css("-webkit-transform", "scale(1, 1)");
        $(this).css("-moz-transform", "scale(1, 1)");
        $(this).css("-o-transform", "scale(1, 1)");
    });
    $(".wei").mouseover(function() {
        $(this).css("-webkit-transform", "scale(1.2, 1.2)");
        $(this).css("-moz-transform", "scale(1.2, 1.2)");
        $(this).css("-o-transform", "scale(1.2, 1.2)");
    });
    $(".wei").mouseleave(function() {
        $(this).css("-webkit-transform", "scale(1, 1)");
        $(this).css("-moz-transform", "scale(1, 1)");
        $(this).css("-o-transform", "scale(1, 1)");
    });
});