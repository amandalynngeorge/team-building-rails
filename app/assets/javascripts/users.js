$(document).ready(function() {
  $(".activityForm").hide()
  $(".showActivity").hide()

  $("#create_link").on("click", function(event){
    event.preventDefault()
    $(".activityForm").toggle();
  })

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

    // $(".submit").on("click", function(event) {
    //   event.preventDefault()
    //   $.ajax({
    //     url: '/activities',
    //     method: 'POST',
    //     data: $(this).serialize(),
    //     success: function(data) {
    //       $('#acitivity_list').append(`<li>${data.content}</li>`)
    //       console.log(data)
    //     }
    //   })
    // })

  //
  // $('.submit').on("click", function(event) {
  //   event.preventDefault()
  //   var activity = $("form").serialize()
  //   var activities = $.post("/activities", values)
  //   //on submit:
  //     //create resource with JS model object
  //     //render response:
  //       //title added to list as link
  //       //full details available when link clicked on
  //   console.log(activity)
  //   console.log(acitivities)
  // })
  //

})

function Activity(id, title, description, goal, rules, time, category_id, topics_attributes) {
  activity.id = id
  activity.title = title
  activity.description = description
  activity.goal = goal
  activity.rules = rules
  activity.time = time
  activity.category_id = category_id
  activity.topics_attributes = topics_attributes
}

Activity.prototype.formatIndex = function() {
  let activityHtml = `
  <h3>${this.title}</h3>
  `
  return activityHtml
}
