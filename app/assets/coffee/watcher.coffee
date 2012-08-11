socket = io.connect('/')

socket.on 'connect', ->
  socket.emit 'is-watching', 'caleb'

socket.on 'tick', (data) ->
  $('.timer').html(data)
