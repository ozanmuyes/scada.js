# require! 'prelude-ls': {group-by, sort-by}
# require! components
# require! 'aea': {sleep, unix-to-readable}
# require! './simulate-db': {db}
# require! './pages/test-data-table/my-table': {my-table}

require! 'components'
require! 'aea': {sleep, unix-to-readable, merge, pack}
require! 'prelude-ls': {sum, split, sort-by, flatten, group-by, reverse, map, take, find}

require! './base': {ractive}
# main pages
# require! './pages/ack-button/ack-button': {ack-button-fragment: fragment}
require! './pages/checkbox/checkbox': {fragment: checkbox-fragment}
require! './pages/csv-importer/csv-importer': {fragment: csv-importer-fragment}
require! './pages/date-picker/date-picker': {fragment: date-picker-fragment}
# require! './pages/example-component/example-component': {example-component-fragment: fragment}
require! './pages/file-read/file-read': {fragment: file-read-fragment}
# TODO formal-field
# require! './pages/input-field/input-field': {input-field-fragment: fragment}
# require! './pages/print-button/print-button': {print-button-fragment: fragment}
# TODO r-table
# require! './pages/search-combobox/search-combobox': {search-combobox-fragment: fragment}
# require! './pages/test-data-table/my-table': {fragment: test-data-table-fragment}
require! './pages/todo/todo': {fragment: todo-fragment}

# Ractive data
ractive-data =
    login:
        ok: yes # for demonstration purposes only
    # db: null
    # TODO my-table: test-data-table-fragment
    menu:
        # * title: "ack-button"
        #   url: '#/ack-button'
        * title: "checkbox"
          url: "#/checkbox"
        * title: "csv-importer"
          url: "#/csv-importer"
        * title: "date-picker"
          url: "#/date-picker"
        # * title: "example-component"
        #   url: "#/example-component"
        * title: "file-read"
          url: "#/file-read"
        # TODO formal-field
        # * title: "input-field"
        #   url: "#/input-field"
        # * title: "print-button"
        #   url: "#/print-button"
        # TODO r-table
        # * title: "search-combobox"
        #   url: "#/search-combobox"
        # * title: "test-data-table"
        #   url: "#/test-data-table"
        * title: "todo"
          url: "#/todo"
        
    unix-to-readable: unix-to-readable

    csv-importer: csv-importer-fragment
    date-picker: date-picker-fragment
    checkbox: checkbox-fragment
    file-read: file-read-fragment

for k, v of ractive-data
    ractive.set "#{k}", v

# TODO Split events below to relevant files

# ractive = new Ractive do
#     el: '#main-output'
#     template: RACTIVE_PREPARSE('layout.pug')
#     data:
#         # db: db
#         # my-table: my-table
#         button:
#             show: yes
#             send-value: ''
#             bound-val: ''
#             info-title: ''
#             info-message: ''
#             output: 'hello'
#         # csv-importer:
#         #     show: yes
#         #     test-data: """
#         #         74LPPD2KZ7N,ACILI EZME 200 GR,5T1544H8
#         #         74LPPD2L06J,ACILI EZME 200 GR MEAL BOX,4NL8C89Y
#         #         74LPPD2L08J,ACILI EZME 3000 GR,55LE456H
#         #         """

#         combobox:
#             show: yes
#             list1:
#                 * id: \1
#                   name: \hello
#                 * id: \2
#                   name: \world
#                 * id: \3
#                   name: \heyy!
#                 * id: \4
#                   name: "çalış öğün"
#                 * id: \5
#                   name: "ÇALIŞ ÖĞÜN"
#             list2:
#                 * id: \aaa
#                   name: \totally
#                 * id: \bbb
#                   name: \different
#                 * id: \ccc
#                   name: \list
#             boundSelected: null
#         # date-picker:
#         #     show: yes
#         # checkbox:
#         #     checked1: no
#         #     checked2: no
#         # file-read:
#         #     show: yes
#         #     files: []
#         # todo:
#         #     show: yes
#         #     todos1:
#         #         * id: 1
#         #           content: 'This is done by default'
#         #           done-timestamp: 1481778240000
#         #         * id: 2
#         #           content: 'This is done by default too'
#         #           done-timestamp: 1481778242000
#         #         * id: 3
#         #           content: 'This can not be undone'
#         #           can-undone: false
#         #         * id: 4
#         #           content: 'This has a due time'
#         #           due-timestamp: 1481778240000
#         #         * id: 5
#         #           content: 'This depends on 1 and 2'
#         #         * id: 6
#         #           content: 'This depends on 3 and 5 (above one)'

#         #     log1: []
#         #     todos2:
#         #         * id: 1
#         #           content: 'Do this'
#         #         * id: 2
#         #           content: 'Do that'
#         #         * id: 3
#         #           content: 'Finally do this'
#         #     log2: []
#         # unix-to-readable: unix-to-readable
#         # menu: []
#         # menu-links:
#         #     * title: "Siparişler"
#         #       url: '#/orders'
#         #       icon: "credit-card"
#         #     * title: "İş Planları"
#         #       url: '#/production-jobs'
#         #       icon: "list-alt"
#         #     * title: "Paketleme"
#         #       url: '#/bundling'
#         #       icon: 'gift'
#         #     * title: "Sevkiyat"
#         #       icon: 'road'
#         #       sub-menu:
#         #         * title: "dispatch submenu1"
#         #           url: '#/dispatch/1'
#         #         * title: "dispatch submenu2"
#         #           url: '#/dispatch/2'
#         #         * title: "dispatch submenu3"
#         #           url: '#/dispatch/3'
#         #         * title: "dispatch submenu4"
#         #           url: '#/dispatch/4'

#         #     * title: "Depo İstek Formu"
#         #       url: '#/raw-material-requests'
#         #       icon: 'shopping-cart'
#         #     * title: "Satın Alma"
#         #       url: '#/raw-material-purchases'
#         #       icon: 'briefcase'
#         #     * title: "Hammadde Kabul"
#         #       url: '#/raw-material-admission'
#         #       icon: 'download-alt'
#         #     * title: "Tanımlamalar"
#         #       icon:"cog"
#         #       sub-menu:
#         #         * title: "Müşteri Tanımla"
#         #           url: '#/definitions/client'
#         #         * title: "Marka Tanımla"
#         #           url: '#/definitions/brands'
#         #         * title: "Tedarikçi Tanımla"
#         #           url: '#/definitions/supplier'
#         #         * title: "Hammadde Tanımla"
#         #           url: '#/definitions/raw-material'
#         #         * title: "Reçete Tanımla"
#         #           url: '#/definitions/recipe'
#         #         * title: "Kap Tanımla"
#         #           url: '#/definitions/container'
#         #         * title: "Paket Tanımla"
#         #           url: '#/definitions/packaging'
#         #         * title: "Çalışan Tanımla"
#         #           url: '#/definitions/workers'
#         #           icon: 'user'

# ractive.on do
#     'complete': ->
#         __ = @
#         <- sleep 1000ms
#         __.set \menu, __.get \menuLinks

#     test-ack-button1: (ev, value) ->
#         ev.component.fire \state, \doing
#         <- sleep 5000ms
#         ractive.set \button.sendValue, value
#         ev.component.fire \state, \done...

#     test-ack-button2: (ev, value) ->
#         ev.component.fire \state, \doing
#         <- sleep 3000ms
#         ev.component.fire \state, \error, "handler 2 got message: #{value}"
#         <- sleep 3000ms
#         ev.component.fire \state, \done

#     test-ack-button3: (ev, value) ->
#         ev.component.fire \info, do
#             title: "this is an example info"
#             message: value or "test info..."

#     test-ack-button5: (ev) ->
#         ev.component.fire \info, 'this is a test string (info)'

#     test-ack-button4: (ev, value) ->
#         console.log "asking if yes or no"
#         ok <- ev.component.fire \yesno, do
#             title: 'well...'
#             message: value or 'are you sure?'

#         unless ok
#             msg = "User says it's not OK to continue!"
#             ev.component.fire \output, msg
#             console.error msg
#             return

#         ok <- ev.component.fire \yesno, do
#             title: 'HTML test'
#             message: html: """
#                 <h1>This is header</h1>
#                 <span class="glyphicon glyphicon-ok-sign" style="font-size: 2em"></span>
#                 <span>This is an icon...</span>
#                 """

#         unless ok
#             msg = "User says it's not OK to continue!"
#             ev.component.fire \output, msg
#             console.error msg
#             return

#         msg = "It's OK to go..."
#         console.log msg
#         ev.component.fire \output, msg

#     checkboxchanged: (ev, curr-state, intended-state, value) ->
#         console.log "checkbox event fired, curr: #{curr-state}"
#         ev.component.fire \state, \doing
#         <- sleep 2000ms
#         ev.component.fire \state, intended-state

#     my-print: (html, value, callback) ->
#         callback err=null, body: """
#             <h1>This is value: #{value}</h1>
#             #{html}
#             """

#     todostatechanged: (ev, list, item-index) ->
#         the-item = list[item-index]
#         new-state = if the-item.is-done then \checked else \unchecked
#         old-state = if new-state is \checked then \unchecked else \checked
#         console.log "Bound components: todo item with id of '" + the-item.id + "' state's changed from '" + old-state + "' to '" + new-state + "'"

#     todocompletion: ->
#         console.log "Bound components: all todo items has been done"

#     todotimeout: (item) ->
#         console.log "Bound components: item with id of '" + item.id + "' in the list had been timed out"
#         console.log item

#     todostatechanged2: (ev, list, item-index) ->
#         the-item = list[item-index]
#         new-state = if the-item.is-done then \checked else \unchecked
#         old-state = if new-state is \checked then \unchecked else \checked
#         console.log "UnBound instance: todo item with id of '" + the-item.id + "' state's changed from '" + old-state + "' to '" + new-state + "'"

#     todocompletion2: ->
#         console.log "UnBound instance: all todo items has been done"

#     todotimeout2: (item) ->
#         console.log "UnBound instance: item with id of '" + item.id + "' in the list had been timed out"
#         console.log item

#     uploadReadFile: (ev, file, next) ->
#         ev.component.fire \state, \doing
#         console.log "Appending file: #{file.name}"
#         ractive.push 'fileRead.files', file
#         /*
#         answer <- ev.component.fire \yesno, message: """
#             do you want to proceed?
#         """
#         ev.component.fire \state, \error, "cancelled!" if answer is no
#         */
#         ev.component.fire \state, \done
#         <- sleep 2000ms
#         next!

#     fileReadClear: (ev) ->
#         ractive.set \fileRead.files, []
#         ev.component.fire \info, message: "cleared!"

#     import-csv: (ev, content) ->
#         ev.component.fire \state, \doing
#         console.log "content: ", content
#         ractive.set \csvContent, content
#         ev.component.fire \state, \done...