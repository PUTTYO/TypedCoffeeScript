x :: Number = 3
y :: String = "hello"
z :: String = 'changed'
# z :: String = 4 #=> Error
y = z
# y = x #=> Error
a :: Any = 3
a = 'fadfa'
b = 'a'
fn :: Function = ->
  x = 3
  n = ->
    i = ''
  # x = "" #=> Error
  # y :: String = ""

# f :: Number -> Number = (n) -> n * n
console.log 'finish'
