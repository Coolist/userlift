# Variables
external = {}
externalCount = 0

external.queryString = (queries) ->
  string = []

  for queryKey, queryValue of queries
    string.push encodeURIComponent(queryKey) + '=' + encodeURIComponent(queryValue)

  return string.join '&'

external.load = (queries) ->

  # Create a unique queue ID
  qid = Date.now().toString() + externalCount.toString()
  externalCount++

  # Add a random number to query to prevent caching
  queries.r = qid

  # Store in a queue in local storage if supported
  if browsersLocalStorage
    queue = JSON.parse localStorage._request_queue || '{}'
    queue[qid] = queries
    localStorage._request_queue = JSON.stringify queue

  image = new Image()
  image.src = IMAGE_URL + '?' + external.queryString queries
  image.alt = qid

  # Delete the item in the queue if the request is successful
  if browsersLocalStorage
    image.onload = () ->
      queue = JSON.parse localStorage._request_queue
      delete queue[this.alt]
      localStorage._request_queue = JSON.stringify queue

external.page = (queries) ->
  queries = queries || {}
  queries.type = 'pageview'
  queries.user = externalUserId
  queries.experiments = externalExperiments.list.join '|'
  queries.buckets = externalExperiments.buckets.join '|'
  queries.session = externalExperiments.session
  queries.url = document.URL
  queries.referrer = document.referrer
  queries.title = document.title

  external.load queries

external.event = (queries) ->
  queries = queries || {}
  queries.type = 'event'
  queries.user = externalUserId
  queries.experiments = externalExperiments.list.join '|'
  queries.buckets = externalExperiments.buckets.join '|'
  queries.session = externalExperiments.session

  external.load queries