# Variables
external = {}
externalCount = 0

external.queryString = (queries) ->
  string = []

  for queryKey, queryValue of queries
    string.push encodeURIComponent(queryKey) + '=' + encodeURIComponent(queryValue)

  return string.join '&'

external.load = (queries) ->
  if initReady

    # Create a unique queue ID
    qid = Date.now().toString() + externalCount.toString()
    externalCount++

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
  else
    init.queue queries

external.page = (queries) ->
  queries.type = 'pageview'
  queries.user = 'Iy8XYtAqWV'
  queries.experiment = '3UY83vG9qY'
  queries.bucket = 'idGD65rWFb'

  external.load queries

external.event = (queries) ->
  queries.type = 'event'
  queries.user = 'Iy8XYtAqWV'
  queries.experiment = '3UY83vG9qY'
  queries.bucket = 'idGD65rWFb'

  external.load queries