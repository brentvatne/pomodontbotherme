events = (app) ->

  io = require('socket.io').listen(app)

  # For Heroku compatability, use xhr-polling instead of WebSockets
  io.configure ->
    io.set("transports", ["xhr-polling"])
    io.set("polling duration", 10)

  io.sockets.on 'connection', (socket) ->

    # ###################
    #      Worker
    # ###################
    socket.on 'is-worker', (username) ->

      socket.join(username)

      socket.on 'tick', (time) ->
        socket.broadcast.to(username + '-watchers').emit('tick', time)

    # ###################
    #       Watcher
    # ###################
    socket.on 'is-watching', (username) ->

      socket.join(username + '-watchers')

      socket.broadcast.to(username).emit('new-connection', 'sup')

module.exports = events
