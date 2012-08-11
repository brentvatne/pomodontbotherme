routes = (app) ->

  app.get '/caleb/watch', (req, res) ->
    res.render "#{__dirname}/views/watcher",
      title: 'caleb stalker'

  app.get '/caleb', (req, res) ->
    res.render "#{__dirname}/views/worker",
      title: 'you are caleb'

  app.get '/', (req, res) ->
    res.render "#{__dirname}/views/index",
      title: 'home'

module.exports = routes
