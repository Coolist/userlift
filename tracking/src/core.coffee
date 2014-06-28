# Core

# Expose methods
window.circled = window.circled || []
window.circled.page = external.page
window.circled.event = external.event

# Config
IMAGE_URL = 'http://localhost:3000/e'

# External variables
externalUserId = window.circled.userId
externalExperiments = window.circled.experiments

# Initialize when the DOM is ready
if document.readyState is 'complete'
  init.ready()
else
  window.onload = () ->
    init.ready()