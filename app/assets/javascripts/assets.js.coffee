return unless $(document.body).hasClass 'assets'

editor = ace.edit 'editor'
HtmlMode = require('ace/mode/html').Mode
session = editor.getSession()
session.setMode new HtmlMode

# Tab size
session.setTabSize 2

# Soft tabs
session.setUseSoftTabs true

($ 'form').submit () ->
  ($ '.content').val session.getValue()

