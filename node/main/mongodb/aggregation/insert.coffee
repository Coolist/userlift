###
## Aggregate data as it is inserted
###

# Load modules
db = require('../connect').db

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
        value: '/pricing.html'
      },
      {
        type: 'pageview'
        operator: '!='
        value: '/get.html'
      }
    ]
  ]
]

# Count the number of filters using a specific operator
countOperator = (op, array) ->
  count = 0

  for i in array
    if i.operator is op
      count++

  return count

# Filter each track (total users)
checkFilterTotalUsers = (check) ->
  switch check.filter.type
    when 'pageview'
      switch check.filter.operator
        when '='
          if check.filter.value is check.track.track_url.path
            return true
        when '!='
          if check.filter.value is check.track.track_url.path
            return false
            

# Total users filter
filterTotalUsers = (tracks, filters) ->

  results = {}

  for track, trackIndex in tracks
    for filter, filterIndex in filters
      if track.type is filter.type
        result = checkFilterTotalUsers
          'track': track
          'filter': filter

        results[filterIndex] = result if result? and results[filterIndex] isnt false

  counts =
    passed: 0
    failed: 0

  for result, passed of results
    if passed
      counts.passed++
    else
      counts.failed++

  if counts.failed > 0
    match = false
  else if counts.passed is countOperator '=', filters
    match = true

  return {
    match: match || false
  }

# Checks to see if the tracks match the filters
matchFilter = (type, tracks, filters) ->
  switch type
    when 'total_users'
      return filterTotalUsers tracks, filters

# Aggregates a recently inserted track
exports.aggregate = (raw) ->
  db.tracks.find
    experiments_user: raw.experiments_user
  .sort({ time_timestamp: -1 }).toArray().then (tracks) ->
    console.log matchFilter array[0].series[0].type, tracks, array[0].series[0].filters
  .done()