events = (app) ->

  io = require('socket.io').listen(app)

  io.sockets.on 'connection', (socket) ->

    socket.on 'is-user', (username) ->
      socket.join(username)

      socket.on 'tick', (time) ->
        socket.broadcast.to(username + '-watchers').emit('tick', time)

    socket.on 'watch-user', (username) ->
      socket.join(username + '-watchers')
      socket.broadcast.to(username).emit('new-connection', 'sup')

module.exports = events