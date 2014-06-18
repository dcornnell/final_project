# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).ready -> 
    $('#attempts').dataTable()

	
	checkbox = document.getElementById("completed")
	flash_div = document.getElementById("flash")
	showHiddenDiv = ->
  	if checkbox.checked
    	flash_div.style["display"] = "block"
  	else
    	flash_div.style["display"] = "none"
  	return

	checkbox.onclick = showHiddenDiv
	showHiddenDiv()

