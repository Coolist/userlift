# Load Node modules
should = require 'should'
request = require 'supertest'

# Load configuration file
config = '../../node/config.json'

if config.environment is not 'development'
  throw Error 'Tests must be running on a development environment.'

# Variables
api = 'http://localhost:3000/api/1'

describe 'Experiments', () ->

  projectId = ''

  before (done) ->
    request api
      .post '/projects'
      .send
        name: 'Test Project'
      .end (e, res) ->
        projectId = res.body.id
        done()

  after (done) ->
    request api
      .delete "/projects/#{projectId}"
      .end (e, res) ->
        done()

  it 'should create an experiment', (done) ->
    request api
      .post "/projects/#{projectId}/experiments"
      .send
        name: 'Test Experiment'
      .end (e, res) ->
        res.status.should.equal 200
        res.body.success.should.equal true
        res.body.id.length.should.be.above 1
        done()

  it 'should not create an experiment when name is blank', (done) ->
    request api
      .post "/projects/#{projectId}/experiments"
      .send
        name: undefined
      .end (e, res) ->
        res.status.should.equal 400
        res.body.success.should.equal false
        done()

  it 'should get all experiments as well as a single experiment by id', (done) ->
    request api
      .get "/projects/#{projectId}/experiments"
      .end (e, res) ->
        res.status.should.equal 200
        res.body.length.should.be.above 0
        res.body[0].id.length.should.be.above 1

        request api
          .get "/projects/#{projectId}/experiments/#{res.body[0].id}"
          .end (e, res) ->
            res.status.should.equal 200
            res.body.id.length.should.be.above 0
            done()

  it 'should update an experiment by id', (done) ->
    request api
      .get "/projects/#{projectId}/experiments"
      .end (e, res) ->
        experimentId = res.body[0].id

        request api
          .put "/projects/#{projectId}/experiments/#{experimentId}"
          .send
            name: 'Renamed Test Experiment'
            active: true
            archived: true
          .end (e, res) ->
            res.status.should.equal 200
            res.body.success.should.equal true

            request api
              .get "/projects/#{projectId}/experiments/#{experimentId}"
              .end (e, res) ->
                res.body.name.should.equal 'Renamed Test Experiment'
                res.body.active.should.equal true
                res.body.archived.should.equal true
                done()

  it 'should delete an experiment by id', (done) ->
    request api
      .get "/projects/#{projectId}/experiments"
      .end (e, res) ->

        experimentId = res.body[0].id

        request api
          .delete "/projects/#{projectId}/experiments/#{experimentId}"
          .end (e, res) ->
            res.status.should.equal 200
            res.body.success.should.equal true

            request api
              .get "/projects/#{projectId}/experiments/#{experimentId}"
              .end (e, res) ->
                res.status.should.equal 404
                done()