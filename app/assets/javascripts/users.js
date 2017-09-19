  $(document).ready(function() {
    attachListeners();
  })

function attachListeners() {
  $('.link').on("click", function() {
    event.preventDefault()
    showActivity()
  })

  $("#create_link").on("click", function(event){
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
