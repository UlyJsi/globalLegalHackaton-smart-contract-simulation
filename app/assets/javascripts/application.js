//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(function() {

  // show / hide buttons
  $(".new-receiver").hide();
  $(".old-receiver").hide();
  $("#file-change").hide();
  $("#download-file").hide();
  $("#date-descrip").hide();
  $("#date-accept-show").hide();
  $("#show-contract").hide();

  $(".hide-btn-old").click(function(event) {
    event.preventDefault();
    $(this).hide();
    $(".hide-btn-new").hide();
    $(".old-receiver").show();
  });
  $(".hide-btn-new").click(function(event) {
    event.preventDefault();
    $(this).hide();
    $(".hide-btn-old").hide();
    $(".new-receiver").show();
  });
  // sender
  $(".accept-green").click(function() {
    $("button[data-dismiss='modal']").click();
    $("#smart-contract-nda").removeClass("btn-danger");
    $("#smart-contract-nda").addClass("btn-success");
    $("#file-change").show();
    $("#download-file").show();
    $("#smart-contract-time").prop('disabled', true);
    $(".download-file").css({"background-color":"black", "color":"#fff"});
  });

  $(".accept-green-time").click(function() {
    $("button[data-dismiss='modal']").click();
    $("#smart-contract-time").removeClass("btn-danger");
    $("#smart-contract-time").addClass("btn-success");
    $("#file-change").show();
    $("#smart-contract-nda").prop('disabled', true);
    $("#download-file").show();
    var dateValue = document.getElementById("show-date").value;
    $("#date-accept").text(String(dateValue).replace('T',' '));
  });

  $("#hide-contract-label").click(function(event) {
    event.preventDefault();
    $(this).hide();
    $("#show-contract").show();

  });

  // receiver 
  $(".smart-contract-time").click(function() {
    $("#date-accept-show").show();
    $(".show-date").hide();
    $(".download-file").css({"cursor":"not-allowed"});
    $(".download-file").click(false);
    $("#date-descrip").show();
  });

  $(".no-accept-green").click(function() {
    $("button[data-dismiss='modal']").click();
  });

});