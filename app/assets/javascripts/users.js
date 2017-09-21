$(document).ready(function() {
  $(".user_new_activity_form").hide()
  $(".showActivity").hide()

  $('.link').on("click", function() {
    event.preventDefault()
    $(".showActivity").toggle()
    var activityId = parseInt($(this).attr("data-id"));
    var userId = parseInt($("#username").attr("data-id"));
    $.get("/users/" + userId + "/activities/" + activityId + ".json", function(data) {
      $(".title").text(data["title"]);
      $(".description").text(data["description"]);
      $(".goal").text(data["goal"]);
      $(".rules").text(data["rules"]);
      $(".time").text(data["time"]);
      $(".category").text(data["category"]["name"]);
    });
  })

  $("#create_link").on("click", function(event){
    createForm()
  })

  $(".submit").on("click", function(event) {
    event.preventDefault()
  })

})

function createForm() {
  event.preventDefault()
  $(".user_new_activity_form").toggle();
}
