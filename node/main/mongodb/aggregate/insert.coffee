###
## Aggregate data as it is inserted
###

# Load modules
db = require('../connect').db
helpers = require './helpers'

# Collections
db.tracks = db.collection 'tracks'
db.aggregate = db.collection 'aggregate'

# Temporary query object
array = [
	type: 'line'
	axis: 'time-accumulation'
	series: [
		type: 'total_users',

		filters: [
			{
				type: 'pageview'
				operator: '='
				value: '/test'
			}
		]
	]
]

# Compare based on text operator
compareOperator = (value1, value2, op) ->
	switch op
		when '='
			return value1 is value2
		when '!='
			return value1 isnt value2

filterTotalUsers = (tracks, filters) ->
	total = []
	for track in tracks
		for filter, filterIndex in filters
			if track.type is filter.type
				switch filter.type
					when 'pageview'
						c = compareOperator filter.value, track.track_url.path, filter.operator
						if c
							helpers.pushUnique filterIndex, total

	if total.length is filters.length
		return true
	else
		return false

# Checks to see if the tracks match the filters
matchFilter = (type, tracks, filters) ->
	switch type
		when 'total_users'
			filterTotalUsers tracks, filters

# Aggregates a recently inserted track
exports.aggregate = (raw) ->
	db.tracks.find
		experiments_user: raw.experiments_user
	.toArray().then (tracks) ->
		matchFilter array[0].series[0].type, tracks, array[0].series[0].filters
	.done()