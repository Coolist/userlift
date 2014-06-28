# Variables
init = {}

init.queue = (object) ->
  initQueue.push object

init.loadMethods = () ->
  if window.circled.methodQueue
    for method in window.circled.methodQueue
      window.circled[method[0]].apply undefined, method[1]

init.ready = () ->
  if browsersLocalStorage
    q = JSON.parse localStorage._request_queue || '{}'
    localStorage._request_queue = '{}'

    for id, value of q
      external.load value

  init.loadMethods()