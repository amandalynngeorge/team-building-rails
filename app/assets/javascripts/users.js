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
  var activityId = parseInt($(".link").attr("data-id"));
  var userId = parseInt($("#username").attr("data-id"));
    $.get("/users/" + userId + "/activities/" + activityId + ".json", function(data) {
      $(".title").text(data["title"]);
      $(".description").text(data["description"]);
      $(".goal").text(data["goal"]);
      $(".rules").text(data["rules"]);
      $(".time").text(data["time"]);
      $(".category").text(data["category"]["name"]);
    });
}
