return unless $(document.body).hasClass 'assets'

$form = ($ 'form')

# Create editor
editor = ace.edit 'editor'
HtmlMode = require('ace/mode/html').Mode
session = editor.getSession()
session.setMode new HtmlMode
session.setTabSize 2
session.setUseSoftTabs true

# Save on c-s
canon = require('pilot/canon')
canon.addCommand
  name: 'myCommand'
  bindKey:
    win: 'Ctrl-s',
    mac: 'Command-s',
    sender: 'editor'
  exec: (env, args, request) ->
    save()

# UI event bindings
$form.submit () ->
  ($ '.content').val session.getValue()

# Save button
($ '#save').click (e) ->
  save
  e.preventDefault()

save = () ->
  ($ '.content').val session.getValue()
  $.post $form.attr('action'), $form.serialize(), (() -> ), 'json'
