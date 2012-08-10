routes = (app) ->

  app.get '/caleb/bother', (req, res) ->
    res.render "#{__dirname}/views/bother",
      title: 'remote'

  app.get '/caleb', (req, res) ->
    res.render "#{__dirname}/views/doer",
      title: 'audience'

  app.get '/', (req, res) ->
    res.render "#{__dirname}/views/index",
      title: 'home'

module.exports = routes
