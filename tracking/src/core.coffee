# Core

# Expose methods
window.userlift = window.userlift || []
window.userlift.page = external.page
window.userlift.event = external.event

# Config
IMAGE_URL = 'http://localhost:3000/e'

# Initialize when the DOM is ready
if document.readyState is 'complete'
  init.ready()
else
  window.onload = () ->
    init.ready()