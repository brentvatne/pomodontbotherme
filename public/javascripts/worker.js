(function() {
  var socket;

  socket = io.connect('/');

  socket.on('connect', function() {
    return socket.emit('is-worker', 'caleb');
  });

  socket.on('new-connection', function(data) {
    return console.log(data);
  });

  socket.on('disruption', function() {});

  $(function() {
    var decrementCounterUntilZero;
    $('.timer-start-button').on('click', function() {
      var numMinutes, numSeconds;
      numMinutes = parseInt($('.timer').val());
      numSeconds = numMinutes * 60;
      $('.timer').val(numSeconds);
      return setTimeout(decrementCounterUntilZero, 1000);
    });
    return decrementCounterUntilZero = function() {
      var currentTime, newTime;
      currentTime = parseInt($('.timer').val());
      newTime = currentTime - 1;
      $('.timer').val(newTime);
      socket.emit('tick', newTime);
      console.log('tick!');
      if (newTime > 0) {
        return setTimeout(decrementCounterUntilZero, 1000);
      }
    };
  });

}).call(this);
