# Load modules
db = require('./connect').db
db.tracks = db.collection 'tracks'

exports.addPageview = (queries) ->

	time = new Date()

	insert =
		'type': 'pageview'
		'experiment_id': queries.experiment || ''
		'experiment_bucket': queries.bucket || ''
		'track_user': queries.user || ''
		'track_url': queries.url || ''
		'track_title': queries.title || ''
		'track_referrer': queries.referrer || ''
		'time_timestamp': time
		'time_object':
			'year': time.getFullYear()
			'month': time.getMonth()
			'day': time.getDate()
			'hour': time.getHours()
			'minute': time.getMinutes()

	db.tracks.insert(insert).then (docs) ->
		console.log docs
		return