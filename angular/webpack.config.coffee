path = require 'path'
webpack = require 'webpack'

appRoot = "#{__dirname}/src"
styleRoot = "#{appRoot}/assets/styles"
bowerRoot = "#{__dirname}/bower_components"

module.exports =
  debug: true
  entry: [
    "#{appRoot}/app.coffee"
  ]
  output:
    path: './compile'
    filename: 'app.js'
    chunkFilename: "[id].app.js"

  module:
    loaders: [
      # required to write 'require('./style.css')'
      test: /\.css$/
      loaders: ['style','css']
    ,
      # required to write 'require('./style.scss')'
      test: /\.scss$/
      loaders: ['style','css','autoprefixer-loader?browsers=last 2 versions, > 5%',"sass?includePaths[]=#{styleRoot}"]
    ,
      test: /\.coffee$/
      loader: 'coffee'
    ,
      # require raw html for partials
      test: /\.html$/
      loader: 'raw'
    ]

    noParse: [
      path.join bowerRoot, '/angular'
      path.join bowerRoot, '/angular-route'
    ]

  resolve:
    alias:
      bower: bowerRoot
      'bower/angular': 'exports?angular!bower/angular/angular'

    extensions: [
      ''
      '.js'
      '.coffee'
      '.scss'
      '.css'
    ]
    
    root: appRoot

  plugins: [
    # bower.json resolving
    new webpack.ResolverPlugin [
      new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin "bower.json", ["main"]
    ], ["normal", "loader"]

    # disable dynamic requires (disable moment langs)
    new webpack.ContextReplacementPlugin(/.*$/, /a^/)
  ]

  devtool: 'eval'