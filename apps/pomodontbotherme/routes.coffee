routes = (app) ->

  app.get '/caleb/bother', (req, res) ->
    res.render "#{__dirname}/views/bother",
      title: 'caleb stalker'

  app.get '/caleb', (req, res) ->
    res.render "#{__dirname}/views/doer",
      title: 'you are caleb'

  app.get '/', (req, res) ->
    res.render "#{__dirname}/views/index",
      title: 'home'

module.exports = routes
