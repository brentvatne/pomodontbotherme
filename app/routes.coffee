routes = (app) ->

  app.get '/', (req, res) ->
    res.render "#{__dirname}/views/index",
      title: 'home'

  app.get '/:user', (req, res) ->
    res.render "#{__dirname}/views/worker",
      title: "#{req.params.user}'s pomodoros"
      user:   req.params.user

  app.get '/:user/watch', (req, res) ->
    res.render "#{__dirname}/views/watcher",
      title: "Watching #{req.params.user}"
      user:   req.params.user

module.exports = routes
