suite 'TypedValues', ->
  suite 'TypedValue Definition', ->
    test 'basic assign', ->
      x :: Number = 3
      eq x, 3

    test 'avoid polution about prototype', ->
      class X
      X::x = 3
      eq X.prototype.x, 3
