$(document).ready(function() {
  attachListeners();
})

function attachListeners() {
  $("#link").on("click", function(event) {
    event.preventDefault()
    showActivity()
  })

  $("#create").on("click", function(event){
    event.preventDefault()
    createForm()
  })
}

function showActivity() {
  alert("show activity")
}

function createForm() {
  alert("create form")
}
