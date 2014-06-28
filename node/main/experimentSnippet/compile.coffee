# Load modules
fs = require 'fs'
Q = require 'q'

# Tracking pixel
exports.get = (req, res) ->

  data = {
    '33JkoT11WD': {
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
    },
    'B9JrA4R7KC': {
      buckets: [
        {
          id: 'b14UdQ2i89'
          code: '$(".cta").text("Do it");'
          weight: 1
        },
        {
          id: '2w91U46PwP'
          code: '$(".cta").text("Make Bread!");'
          weight: 1
        }
      ]
    }
  }

  # Load template
  template = fs.readFileSync __dirname + '/template/compiled/template.js', 'utf8'

  # Compile everything
  head = 'window.circled=window.circled||[];window.circled.experiments=[];window.circled.experiments.data=JSON.parse(\'' + (JSON.stringify data).replace(/\"/g, '\\"') + '\');'
  buffer = head + template

  res.set
    'Content-Type': 'text/javascript'
    'Cache-Control': 'public, max-age=60',
    'Expires': new Date Date.now() + 60 * 1000
  
  res.send buffer, 200