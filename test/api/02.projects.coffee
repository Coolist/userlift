# Load Node modules
should = require 'should'
request = require 'supertest'

# Load configuration file
config = '../../node/config.json'

if config.environment is not 'development'
  throw Error 'Tests must be running on a development environment.'

# Variables
api = 'http://localhost:3000/api/1'

describe 'Projects', () ->
  it 'should create a project', (done) ->
    request api
      .post '/projects'
      .send
        name: 'Test Project'
      .end (e, res) ->
        res.status.should.equal 200
        res.body.success.should.equal true
        res.body.id.length.should.be.above 1
    done()

  it 'should not create a project when name is blank', (done) ->
    request api
      .post '/projects'
      .send
        name: undefined
      .end (e, res) ->
        res.status.should.equal 400
        res.body.success.should.equal false
        done()

  it 'should get all projects as well as a single project by id', (done) ->
    request api
      .get '/projects'
      .end (e, res) ->
        res.status.should.equal 200
        res.body.length.should.be.above 0
        res.body[0].id.length.should.be.above 1

        request api
          .get '/projects/' + res.body[0].id
          .end (e, res) ->
            res.status.should.equal 200
            res.body.id.length.should.be.above 0
            done()

  it 'should update a project by id', (done) ->
    request api
      .get '/projects'
      .end (e, res) ->
        projectId = res.body[0].id

        request api
          .put '/projects/' + projectId
          .send
            name: 'Renamed Test Project'
          .end (e, res) ->
            res.status.should.equal 200
            res.body.success.should.equal true

            request api
              .get '/projects/' + projectId
              .end (e, res) ->
                res.body.name.should.equal 'Renamed Test Project'
                done()

  it 'should delete a project by id', (done) ->
    request api
      .get '/projects'
      .end (e, res) ->

        projectId = res.body[0].id

        request api
          .delete '/projects/' + projectId
          .end (e, res) ->
            res.status.should.equal 200
            res.body.success.should.equal true

            request api
              .get '/projects/' + projectId
              .end (e, res) ->
                res.status.should.equal 404
                done()
