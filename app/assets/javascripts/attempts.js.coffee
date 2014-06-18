# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


checkbox = document.getElementById("completed")
flash_div = document.getElementById("flash")
showHiddenDiv = ->
  if checkbox != null 
    if checkbox.checked
      flash_div.style["display"] = "block"
    else
      flash_div.style["display"] = "none"
    return

if checkbox != null
  checkbox.onclick = showHiddenDiv
  showHiddenDiv()

$ ->
  $(document).ready -> 
    $('#attempts').dataTable()

	


