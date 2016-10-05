###
 This file allows jQuery to function with turbolinks 5! Besides installing
 the jquery-turbolinks gem in the gem file and adding //= require jquery.turbolinks
 in application.js after //= require jquery. We also must reference this file in
 application.js by adding //= require turbolinks-compatibility after
 //= require turbolinks
 All of this is done to allow Turbolinks to load $(document).ready(function() {}) on page load
 rather than loading it on refresh.
###

{defer, dispatch} = Turbolinks

handleEvent = (eventName, handler) ->
  document.addEventListener(eventName, handler, false)

translateEvent = ({from, to}) ->
  handler = (event) ->
    event = dispatch(to, target: event.target, cancelable: event.cancelable, data: event.data)
    event.preventDefault() if event.defaultPrevented
  handleEvent(from, handler)

translateEvent from: "turbolinks:click", to: "page:before-change"
translateEvent from: "turbolinks:request-start", to: "page:fetch"
translateEvent from: "turbolinks:request-end", to: "page:receive"
translateEvent from: "turbolinks:before-cache", to: "page:before-unload"
translateEvent from: "turbolinks:render", to: "page:update"
translateEvent from: "turbolinks:load", to: "page:change"
translateEvent from: "turbolinks:load", to: "page:update"

loaded = false
handleEvent "DOMContentLoaded", ->
  defer ->
    loaded = true
handleEvent "turbolinks:load", ->
  if loaded
    dispatch("page:load")

jQuery?(document).on "ajaxSuccess", (event, xhr, settings) ->
  if jQuery.trim(xhr.responseText).length > 0
    dispatch("page:update")
