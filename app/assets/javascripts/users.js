  $(document).ready(function() {
    attachListeners();
  })

function attachListeners() {
  $('.link').on("click", function() {
    event.preventDefault()
    alert("show this activity")
  })



  $("#create").on("click", function(event){
    event.preventDefault()
    createForm()
  })
}

function showActivity() {
  showActivity()
}

function createForm() {
  alert("create form")
}
