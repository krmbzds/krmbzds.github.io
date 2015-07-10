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
callback = ->
  $(".item-skills").each ->
    newWidth = $(this).parent().width() * $(this).data("percent")
    $(this).width 0
    $(this).animate
      width: newWidth
    , 1000

  $(".icons-red").each ->
    height = $(this).height()
    $(this).animate
      height: 14
    , 2000

$(document).ready callback
resize = undefined
window.onresize = ->
  clearTimeout resize
  resize = setTimeout(->
    callback()
  , 100)
