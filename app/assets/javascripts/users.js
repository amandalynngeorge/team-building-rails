$(document).ready(function() {

  $(".user_new_activity_form").hide()
  $(".showActivity").hide()

  $('.link').on("click", function() {
    event.preventDefault()
    $(".showActivity").show()
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
    event.preventDefault()
    $(".user_new_activity_form").toggle();
  })

  $("#btnsubmit").on("click", function(event) {
    event.preventDefault()
    var url = $(this).data["url"]
    console.log(url)
    $.get(url), function(response) {
      console.log(response)
    }
  })
    // $.post($(this).attr('action', $(this).serialize(), function(response) {
    //   var activityId = parseInt($(this).attr('data-id'))
    //   $.get("/users/" + userId + "/activities/" + activityId + ".json", function(data) {
    //     $(".title").text(data["title"]);
    //     $(".description").text(data["description"]);
    //     $(".goal").text(data["goal"]);
    //     $(".rules").text(data["rules"]);
    //     $(".time").text(data["time"]);
    //     $(".category").text(data["category"]["name"]);
    // }, 'json')
    // $('form :input').attr('value', '')

//close doc.ready
})
