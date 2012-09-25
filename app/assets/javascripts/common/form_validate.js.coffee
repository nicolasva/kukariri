$("input[type=submit]").live 'click', ->
  $(".necessary.error-empty").each ->
    $(this).removeClass('error-empty')
  token = true
  current_form = $(this).closest('form')[0]
  $(".necessary").each ->
    if $(this).val() == '' and $(this).closest('form')[0] == current_form
      $(this).addClass('error-empty')
      token = false
  $(".email").each ->
    unless /^.+@.+\..+$/.test($(this).val())
      if $(this).closest('form')[0] == current_form
        $(this).addClass('error-empty')
        token = false
  $(".number").each ->
    unless !isNaN(parseFloat($(this).val())) && isFinite($(this).val())
      if $(this).closest('form')[0] == current_form
        $(this).addClass('error-empty')
        token = false
  return token


