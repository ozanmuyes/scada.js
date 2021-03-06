modes = ace.require \ace/ext/modelist

Ractive.components['ace-editor'] = Ractive.extend do
    template: RACTIVE_PREPARSE('index.pug')
    isolated: yes
    onrender: ->
        __ = @
        e = ace.edit @find \*

        mode = (__.get \mode) or \javascript
        theme = (__.get \theme) or \light

        theme = \xcode if theme is \light
        theme = \monokai if theme is \dark

        e.set-theme "ace/theme/#{theme}"
        e.get-session!set-mode "ace/mode/#{mode}"
        e.$blockScrolling = Infinity
        ace.require "ace/edit_session" .EditSession.prototype.$useWorker = no

        #console.log "ace editor running..."

        setting = null
        getting = null
        __.observe \code, (val) ->
            return if getting
            setting := yes
            e.set-value(val or '')
            e.clear-selection!
            setting := no


        e.on \change, ->
            console.log "editor change..."
            getting := true
            __.set \code, e.get-value!
            getting := false
