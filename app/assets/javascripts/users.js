  $(document).ready(function() {
    attachListeners();
  })

function attachListeners() {
  $('#link').on("click", function() {
    event.preventDefault()
    alert("show activity")
  })
}

function showActivity() {
  showActivity()
}

function createForm() {
  alert("create form")
}




$.get("#create").on("click", function(event){
  event.preventDefault()
  createForm()
})
