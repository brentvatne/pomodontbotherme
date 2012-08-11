## Pomo...

A public Pomodoro timer. Someone who wants to interrupt you can check
how much time you have left on your current Pomodoro and what you are
working on, then subscribe to receive some kind of notification when
you're free.

Also maybe:

- People leave you a message that you see when your Pomodoro ends.
- Stats etc for Pomodoros: interruptions, disruptions, estimates..
- Authentication

Next things to do:

- Multiple users. Right now only Caleb can use this.
- UI design.
- Pause and stop timer.

### Setup

Just install the packaged dependencies with `npm install`

### Development

#### Asset compilation

Open up a tab for Grunt to watch and automatically compile assets.

```
grunt watch
```

#### Server

Open up a tab for the server.

```
node server.js
```

Restart the server everytime you make a change to the backend.

### Tests

Append the test file name to `bin/test` and then run `npm test`.

### Deployment

```
git push heroku master
heroku ps:scale web=1
```

### Unpackaged Dependencies

```
node  ~> v0.8.6   # brew update node
npm   ~> v1.1.46  # npm update npm -g
grunt ~> 0.3.8    # npm install -g grunt
```
