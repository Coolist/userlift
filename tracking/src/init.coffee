# Variables
init = {}
initQueue = []
initReady = false

init.queue = (object) ->
  initQueue.push object

init.ready = () ->
  initReady = true
  for item in initQueue
    external.load item

  if browsersLocalStorage
    q = JSON.parse localStorage._request_queue || '{}'
    localStorage._request_queue = '{}'

    for id, value of q
      external.load value