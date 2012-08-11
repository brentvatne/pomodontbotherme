socket = io.connect('/')

socket.on 'connect', ->
  socket.emit('is-worker', 'caleb')

socket.on 'new-connection', (data) ->
  console.log(data)

socket.on 'disruption', ->
  # play 'question' audio

$ ->
  $('.timer-start-button').on 'click', ->
    numMinutes = parseInt($('.timer').val())
    numSeconds = numMinutes * 60

    $('.timer').val(numSeconds)
    setTimeout(decrementCounterUntilZero, 1000)

  decrementCounterUntilZero = ->
    # subtract one from value in timer
    currentTime = parseInt($('.timer').val())
    newTime     = currentTime - 1

    # update the value
    $('.timer').val(newTime)

    # emit tick
    socket.emit('tick', newTime)
    console.log('tick!')

    if newTime > 0
      setTimeout(decrementCounterUntilZero, 1000)
