# Load Node modules
should = require 'should'
request = require 'supertest'

# Load configuration file
config = '../../node/config.json'

if config.environment is not 'development'
  throw Error 'Tests must be running on a development environment.'

# Variables
api = 'http://localhost:3000/api/1'

describe 'Authentication', () ->
  it 'should create an account', (done) ->
    request api
      .post '/authentication'
      .send
        name: 'John Smith'
        email: 'JohnSmith@gmail.com'
        password: 'testing123'
      .end (e, res) ->
        res.status.should.equal 200
        res.body.success.should.equal true
        done()

  it 'should not create an account if email exists', (done) ->
    request api
      .post '/authentication'
      .send
        name: 'John Smith'
        email: 'JohnSmith@gmail.com'
        password: 'testing123'
      .end (e, res) ->
        res.status.should.equal 400
        res.body.success.should.equal false
        done()

  it 'should not create an account if password or email is invalid', (done) ->
    request api
      .post '/authentication'
      .send
        email: 'JohnSmith.com'
        password: '12345'
      .end (e, res) ->
        res.status.should.equal 400
        res.body.success.should.equal false
        res.body.messages.length.should.equal 3
        done()