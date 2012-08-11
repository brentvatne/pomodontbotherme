socket = io.connect('/')

socket.on 'connect', ->
  socket.emit 'is-watching', Pomodoro.worker

socket.on 'tick', (data) ->
  $('.time-remaining').html(data)
