$ ->
  
  $("#scroll-to-form").on "click", ->
    $("body").animate {'scrollTop': $("#form-section").offset().top}, 300

  if 'ontouchstart' in window
    $(".project .overlay").css("opacity", 0.9)
    $(".project .ovlerlay")

