# Returns a random item in array based on its weight
randomWeight = (array) ->
  totalWeight = 0
  minWeight = 0
  
  for item in array
    totalWeight += item.weight
  
  random = Math.floor(Math.random() * totalWeight)
  
  for item in array
    minWeight += item.weight
    
    if random < minWeight
      return item

# Create cookie
createCookie = (name, value, expire) ->
  data = [ name + '=' + encodeURIComponent(JSON.stringify value), 'domain=.' + window.location.host.toString(), 'path=/' ]

  if expire?
    data.push 'expires=' + expire

  cookie = data.join ';'
  document.cookie = cookie

# Read a cookie
readCookie = (name) ->
  cookies = document.cookie.match new RegExp name + '=([^;]+)'
  if cookies? and cookies[1]?
    return JSON.parse decodeURIComponent cookies[1]
  else
    return undefined

# Generate a random alphanumeric string
randomString = (length) ->
  characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
  ret = ''
  for i in [1..length] by 1
    ret += characters[ Math.round(Math.random() * (characters.length - 1)) ]
  return ret

# Find value in array
findInArray = (array, key, value) ->
  for item in array
    if item[key] is value
      return item
  return undefined

# Set all buckets
setBuckets = () ->
  buckets = readCookie 'circledBuckets'
  data = window.circled.experiments.data
  window.circled.experiments.bucket = []
  window.circled.experiments.buckets = []
  window.circled.experiments.list = []

  for experimentId, experiment of data
    window.circled.experiments.list.push experimentId

    if buckets? and buckets[experimentId]?
      userBucket = findInArray experiment.buckets, 'id', buckets[experimentId]
      window.circled.experiments.bucket[experimentId] = userBucket
      window.circled.experiments.buckets.push window.circled.experiments.bucket[experimentId].id
    else
      bucketData = buckets || {}
      expires = new Date Date.now() + 60 * 60 * 24 * 365 * 5 * 1000 # 5 Years

      window.circled.experiments.bucket[experimentId] = randomWeight data[experimentId].buckets

      bucketData[experimentId] = window.circled.experiments.bucket[experimentId].id
      window.circled.experiments.buckets.push window.circled.experiments.bucket[experimentId].id
      createCookie 'circledBuckets', bucketData, expires.toUTCString()
      buckets = bucketData

userCookie = readCookie 'circledUser'

if userCookie
  window.circled.userId = userCookie
else
  window.circled.userId = randomString 32
  createCookie 'circledUser', [ window.circled.userId ], (new Date Date.now() + 60 * 60 * 24 * 365 * 5 * 1000).toUTCString()

setBuckets()

$ ->
  code = []

  for experiment in window.circled.experiments.list
    code.push window.circled.experiments.bucket[experiment].code
  
  eval code.join ''