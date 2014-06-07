exports.pushUnique = (value, array) ->
	e = false
	for v in array
		if v is value
			e = true

	if not e
		array.push value