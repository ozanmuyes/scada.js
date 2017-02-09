export fragment =
    todo:
        show: yes
        todos1:
            * id: 1
              content: 'This is done by default'
              done-timestamp: 1481778240000
            * id: 2
              content: 'This is done by default too'
              done-timestamp: 1481778242000
            * id: 3
              content: 'This can not be undone'
              can-undone: false
            * id: 4
              content: 'This has a due time'
              due-timestamp: 1481778240000
            * id: 5
              content: 'This depends on 1 and 2'
            * id: 6
              content: 'This depends on 3 and 5 (above one)'

        log1: []
        todos2:
            * id: 1
              content: 'Do this'
            * id: 2
              content: 'Do that'
            * id: 3
              content: 'Finally do this'
        log2: []
