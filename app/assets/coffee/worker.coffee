socket = io.connect('/')

socket.on 'connect', ->
  socket.emit('is-worker', Pomodoro.worker)

socket.on 'new-connection', (data) ->
  # new connection notification?

socket.on 'disruption', ->
  # play 'question' audio

$ ->
  $('.new-timer').on 'submit', ->
    minutes = parseFloat($('.timer').val())
    seconds = minutes * 60

    Pomodoro.duration = Pomodoro.remaining = seconds
    decrementCounterUntilZero()
    false

  decrementCounterUntilZero = ->
    # Update the remaining time
    Pomodoro.remaining = Pomodoro.remaining - 1

    # Convert the seconds to a readable format
    readableRemainingTime = secondsToHumanizedTime(Pomodoro.remaining)

    # Update the remaining time
    $('.time-remaining').html(readableRemainingTime)

    # Also let the server know
    socket.emit('tick', readableRemainingTime)

    # Hold on a second, then do this again..
    if Pomodoro.remaining > 0
      Pomodoro.activeCounter = setTimeout(decrementCounterUntilZero, 1000)

  # Convert seconds to a readable time with minutes and seconds
  # eg: 330 seconds to 5:30
  secondsToHumanizedTime = (totalSeconds) ->
    minutes = Math.floor(totalSeconds / 60)
    seconds = totalSeconds - (minutes * 60)

    timeString(minutes, seconds)

  # Convert minutes and seconds to a readable time
  # eg: 5 minutes 30 seconds to 5:30
  timeString = (minutes, seconds) ->
    minutesString = '' + minutes
    secondsString = switch seconds
      when 0                 then '00'
      when 1,2,3,4,5,6,7,8,9 then '0' + seconds
      else                         '' + seconds

    "#{minutesString}:#{secondsString}"

window.Pomodoro ||= {}
@Pomodoro = window.Pomodoro
