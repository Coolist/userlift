external.queryString = (queries) ->
	string = []

	for queryKey, queryValue of queries
		string.push encodeURIComponent(queryKey) + '=' + encodeURIComponent(queryValue)

	return string.join '&'


external.load = (queries) ->
	image = new Image()
	image.src = IMAGE_URL + '?' + external.queryString queries