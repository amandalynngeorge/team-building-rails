$(document).ready(function() {
  $('.link').on("click", function() {
    showActivity()
  })

  $("#create_link").on("click", function(event){
    createForm()
  })

})

function createForm() {
  event.preventDefault()
  alert("create form")
}

function showActivity() {
  event.preventDefault()
}
