(function() {
  var socket;

  socket = io.connect('/');

  socket.on('connect', function() {
    return socket.emit('is-watching', Pomodoro.worker);
  });

  socket.on('tick', function(data) {
    return $('.time-remaining').html(data);
  });

}).call(this);
