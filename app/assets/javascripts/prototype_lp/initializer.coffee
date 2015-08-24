$ ->
  
  $("#scroll-to-form").on "click", ->
    $("body").animate {'scrollTop': $("#form-section").offset().top}, 300

