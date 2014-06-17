# Load modules
snippets = require './snippets.coffee'
db = require '../mongodb/tracker.coffee'

# Tracking pixel
exports.get = (req, res) ->

  # TODO: CLEAN ALL OF THIS UP!!!

  data =
    id: 'pKIUcfLOn6'
    buckets: [
      {
        id: 'l7MetfCxxm'
        code: '$(".cta").css({"border-color": "#67D760"});'
        weight: 1
      },
      {
        id: '3BU61g09zX'
        code: '$(".cta").css({"border-color": "#67D760", "background-color": "#67D760", "color": "#FFF"});'
        weight: 1
      }
    ]

  # Clean this as well...
  buffer = 'window.userlift=window.userlift||[];window.userlift.experiment=[];window.userlift.experiment.data=JSON.parse(\'' + (JSON.stringify data).replace(/\"/g, '\\"') + '\');' + snippets.combined

  res.set
    'Content-Type': 'text/javascript'
    'Cache-Control': 'public, max-age=60',
    'Expires': new Date Date.now() + 60 * 1000
  
  res.send buffer, 200