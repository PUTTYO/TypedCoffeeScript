suite 'TypedValues', ->
  suite 'TypedValue Definition', ->
    test 'basic functions', ->
      x :: Number = 3
      eq x, 3
