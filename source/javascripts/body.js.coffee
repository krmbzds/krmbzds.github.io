#= require jquery
#= require bootstrap

# Avoid `console` errors in browsers that lack a console.
(->
  method = undefined
  noop = ->

  methods = [
    'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
    'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
    'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
    'timeStamp', 'trace', 'warn'
  ]

  length = methods.length
  console = (window.console = window.console or {})
  while length--
    method = methods[length]

    # Only stub undefined methods.
    console[method] = noop  unless console[method]
)()

# Place any jQuery/helper plugins in here.
calculate_skills = ->
  $('.item-skills').each ->
    newWidth = undefined
    newWidth = $(this).parent().width() * $(this).data('percent')
    $(this).width 0
    $(this).animate { width: newWidth }, 1000

  $('.icons-red').each ->
    height = undefined
    height = $(this).height()
    $(this).animate { height: 14 }, 2000

# Calculate skills when document ready
$(document).ready calculate_skills()

# Initialize resize
resize = undefined

# Recalculate skills on resize
window.onresize = ->
  clearTimeout resize
  resize = setTimeout (-> calculate_skills()), 100

# Download public key on click
$('#publickey').on 'click', ->
  window.location.assign('pubkey.asc')

# Help icon to open Keybase
$('#keybase').on 'click', ->
  window.open('https://keybase.io/encrypt#krmbzds', '_blank')


