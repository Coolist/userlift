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
  account =
    name: 'John Smith'
    email: 'JohnSmith@gmail.com'
    password: 'testing123'

  it 'should create an account', (done) ->
    request api
      .post '/authentication'
      .send account
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

  it 'should get an access token', (done) ->
    request api
      .get '/authentication/access?email=' + account.email + '&password=' + account.password
      .send()
      .end (e, res) ->
        res.status.should.equal 200
        res.body.success.should.equal true
        res.body.token.length.should.equal 32
        account.access = res.body.token
        done()

  it 'should get a request token using access token', (done) ->
    request api
      .get '/authentication/request?token=' + account.access
      .send()
      .end (e, res) ->
        res.status.should.equal 200
        res.body.success.should.equal true
        res.body.token.length.should.equal 32
        account.request = res.body.token
        done()

  it 'should update an account', (done) ->
    request api
      .put '/authentication?token=' + account.access
      .send
        name: 'Harry'
        email: 'harry@test.com'
        password: account.password
      .end (e, res) ->
        res.status.should.equal 200
        res.body.success.should.equal true

        # TO DO: Check to see if updates were applied

        done()

  it 'should delete an account', (done) ->
    request api
      .delete '/authentication?token=' + account.access
      .send
        password: account.password
      .end (e, res) ->
        res.status.should.equal 200
        res.body.success.should.equal true

        # TO DO: Check to see if delete worked

        done()