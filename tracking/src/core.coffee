# Core

# Config
IMAGE_URL = 'http://localhost:3000/e';

external.page
  url: document.URL + 'load' # prompt 'URL PLEASE', ''
  referrer: document.referrer
  title: document.title

window.onload = () ->
  init.ready() # This should run after the testing DOM modifications have loaded