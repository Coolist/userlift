# Load modules
db = require('./connect').db
insertAggregate = require './aggregate/insert'
db.tracks = db.collection 'tracks'
url = require 'url'


# Logs the raw pageview data
exports.addPageview = (queries) ->

	time = new Date()
	urlParsed = url.parse queries.url || ''

	insert =
		type: 'pageview'
		experiment_id: queries.experiment || ''
		experiment_bucket: queries.bucket || ''
		experiment_user: queries.user || ''
		track_url:
			full: queries.url || ''
			path: urlParsed.path
			domain: urlParsed.hostname
		track_title: queries.title || ''
		track_referrer: queries.referrer || ''
		time_timestamp: time
		time_object:
			year: time.getFullYear()
			month: time.getMonth()
			day: time.getDate()
			hour: time.getHours()
			minute: time.getMinutes()

	db.tracks.insert insert
	.then (doc) ->
		insertAggregate.aggregate doc
	.done()