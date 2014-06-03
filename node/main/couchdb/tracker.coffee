# Load modules
db = require('./connect').db

exports.addPageview = (queries) ->

	time = new Date()

	insert =
		'doc_type': 'pageview'
		'track_user': queries.user || ''
		'track_url': queries.url || ''
		'track_title': queries.title || ''
		'track_referrer': queries.referrer || ''
		'time_timestamp': JSON.stringify(time).replace(/\"/g, '')
		'time_object':
			'year': time.getFullYear()
			'month': time.getMonth()
			'day': time.getDate()
			'hour': time.getHours()
			'minute': time.getMinutes()



	db.insert insert, (err, res) ->
		console.log err if err