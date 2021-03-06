require! [express, fs, http, 'request', './utils/utils', './config/config']
app = express!
port = config.port or 4000
configure-server = !->
  require('./config/express')(app)

initial-services = !->
  #require('./routes/index')(app)
  #require('./routes/users')(app)
  #require('./routes/weather')(app)

run-forever-services = !->
  require('./business/wlan')

module.exports =
  start: !->
    configure-server!
    initial-services!
    run-forever-services!
    app.listen port, !->
      console.log "wether server is listening on #{port}"

  shutdown: !->
    app.close!
