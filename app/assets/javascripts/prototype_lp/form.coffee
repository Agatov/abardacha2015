$ ->

  $("#order-form").on "submit", ->
    username = $("input[name=name]").val()
    phone = $("input[name=phone]").val()
    email = $("input[name=email]").val()

    invalid_fields = []

    if username.length == 0
      invalid_fields.push {field: "name", msg: "Это поле обязательно для заполнения"}

    if phone.length == 0
      invalid_fields.push {field: "phone", msg: "Это поле обязательно для заполнения"}

    if invalid_fields.length > 0
      render_validation_errors invalid_fields
      return false

    show_thank_you()
    $("input[type=text]").val ""
    yaCounter32113166.reachGoal('new_order')

    $.post(
      '/orders'
      {
        "order[name]": username,
        "order[phone]": phone,
        "order[email]": email
      }
      (data) =>
    )

    false

window.render_validation_errors = (invalid_fields) ->
  render_validation_error(field) for field in invalid_fields

window.render_validation_error = (field) ->
  $("input[name=#{field.field}]").addClass "invalid"

window.show_thank_you = ->
  $(".thank-you").css("display", "table")
  $(".thank-you").animate({"opacity": 1}, 300)

  $(".thank-you .close").on "click", ->
    window.hide_thank_you()

window.hide_thank_you = ->
  $(".thank-you").animate({"opacity": 0}, 300, ->
    $(".thank-you").css("display", "none")
    $(".thank-you .close").off "click"
  )
  