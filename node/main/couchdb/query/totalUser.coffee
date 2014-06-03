# Load modules
db = require('../connect').db

exports.getTest = (callback) ->
	db.view 'test', 'all', (err, res) ->
		console.log err if err
		callback(res.rows)