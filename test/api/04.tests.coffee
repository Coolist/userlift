# Load Node modules
should = require 'should'
request = require 'supertest'

# Load configuration file
config = '../../node/config.json'

if config.environment is not 'development'
  throw Error 'Tests must be running on a development environment.'

# Variables
api = 'http://localhost:3000/api/1'

describe 'Tests', () ->

  projectId = ''
  experimentId = ''

  before (done) ->
    request api
      .post '/projects'
      .send
        name: 'Test Project'
      .end (e, res) ->
        projectId = res.body.id
        request api
          .post "/projects/#{projectId}/experiments"
          .send
            name: 'Test Experiment'
          .end (e, res) ->
            experimentId = res.body.id
            done()

  after (done) ->
    request api
      .delete "/projects/#{projectId}"
      .end (e, res) ->
        request api
          .delete "/projects/#{projectId}/experiments/#{experimentId}"
          .end (e, res) ->
            done()

  it 'should create a test', (done) ->
    request api
      .post "/projects/#{projectId}/experiments/#{experimentId}/tests"
      .send
        name: 'Test Test'
        color: '#DF5D1E'
      .end (e, res) ->
        res.status.should.equal 200
        res.body.success.should.equal true
        res.body.id.length.should.be.above 1
        done()

  it 'should not create a test when name is blank', (done) ->
    request api
      .post "/projects/#{projectId}/experiments/#{experimentId}/tests"
      .send
        name: undefined
      .end (e, res) ->
        res.status.should.equal 400
        res.body.success.should.equal false
        done()

  it 'should get all tests as well as a single test by id', (done) ->
    request api
      .get "/projects/#{projectId}/experiments/#{experimentId}/tests"
      .end (e, res) ->
        res.status.should.equal 200
        res.body.length.should.be.above 0
        res.body[0].id.length.should.be.above 1

        request api
          .get "/projects/#{projectId}/experiments/#{experimentId}/tests/#{res.body[0].id}"
          .end (e, res) ->
            res.status.should.equal 200
            res.body.id.length.should.be.above 0
            res.body.color.should.equal '#DF5D1E'
            done()

  it 'should update a test by id', (done) ->
    request api
      .get "/projects/#{projectId}/experiments/#{experimentId}/tests"
      .end (e, res) ->
        testId = res.body[0].id

        request api
          .put "/projects/#{projectId}/experiments/#{experimentId}/tests/#{testId}"
          .send
            name: 'Renamed Test Test'
            color: 'FFFFFF'
          .end (e, res) ->
            res.status.should.equal 200
            res.body.success.should.equal true

            request api
              .get "/projects/#{projectId}/experiments/#{experimentId}/tests/#{testId}"
              .end (e, res) ->
                res.body.name.should.equal 'Renamed Test Test'
                res.body.color.should.equal '#FFFFFF'
                done()

  it 'should delete a test by id', (done) ->
    request api
      .get "/projects/#{projectId}/experiments/#{experimentId}/tests"
      .end (e, res) ->

        testId = res.body[0].id

        request api
          .delete "/projects/#{projectId}/experiments/#{experimentId}/tests/#{testId}"
          .end (e, res) ->
            res.status.should.equal 200
            res.body.success.should.equal true

            request api
              .get "/projects/#{projectId}/experiments/#{experimentId}/tests/#{testId}"
              .end (e, res) ->
                res.status.should.equal 404
                done()