(function() {
  var socket;

  socket = io.connect('/');

  socket.on('connect', function() {
    return socket.emit('is-worker', Pomodoro.worker);
  });

  socket.on('new-connection', function(data) {});

  socket.on('disruption', function() {});

  $(function() {
    var decrementCounterUntilZero, secondsToHumanizedTime, timeString;
    $('.timer-start-button').on('click', function() {
      var minutes, seconds;
      minutes = parseFloat($('.timer').val());
      seconds = minutes * 60;
      Pomodoro.duration = Pomodoro.remaining = seconds;
      return decrementCounterUntilZero();
    });
    decrementCounterUntilZero = function() {
      var readableRemainingTime;
      Pomodoro.remaining = Pomodoro.remaining - 1;
      readableRemainingTime = secondsToHumanizedTime(Pomodoro.remaining);
      $('.time-remaining').html(readableRemainingTime);
      socket.emit('tick', readableRemainingTime);
      if (Pomodoro.remaining > 0) {
        return Pomodoro.activeCounter = setTimeout(decrementCounterUntilZero, 1000);
      }
    };
    secondsToHumanizedTime = function(totalSeconds) {
      var minutes, seconds;
      minutes = Math.floor(totalSeconds / 60);
      seconds = totalSeconds - (minutes * 60);
      return timeString(minutes, seconds);
    };
    return timeString = function(minutes, seconds) {
      var minutesString, secondsString;
      minutesString = '' + minutes;
      secondsString = (function() {
        switch (seconds) {
          case 0:
            return '00';
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
            return '0' + seconds;
          default:
            return '' + seconds;
        }
      })();
      return "" + minutesString + ":" + secondsString;
    };
  });

  window.Pomodoro || (window.Pomodoro = {});

  this.Pomodoro = window.Pomodoro;

}).call(this);
