$(document).ready(function() {
  // $(".activityForm").hide()
  // $(".showActivity").hide()
  //
  // $("#create_link").on("click", function(event){
  //   event.preventDefault()
  //   $(".activityForm").toggle();
  // })

  bindClickHandlers()
})

const bindClickHandlers = () => {
  $(".username_activities").on("click", (e) => {
    e.preventDefault()
    var userId = parseInt($("#username").attr("data-id"));
    fetch(`/users/${userId}/activities.json`)
      .then(res => res.json())
      .then(data => {
        $("#activity_id").html("")
        activities.forEach((activity) => {
          let newActivity = new Activity(activity)
          let activityHtml = newActivity.formatIndex()
          $('#username_activities').append(activityHtml)
          console.log(newActivity)
        })
      })
  })
}

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

//
//   $('.link').on("click", function() {
//     event.preventDefault()
//     $(".showActivity").show()
//     var activityId = parseInt($(this).attr("data-id"));
//     var userId = parseInt($("#username").attr("data-id"));
//     $.get("/users/" + userId + "/activities/" + activityId + ".json", function(data) {
//       $(".title").text(data["title"]);
//       $(".description").text(data["description"]);
//       $(".goal").text(data["goal"]);
//       $(".rules").text(data["rules"]);
//       $(".time").text(data["time"]);
//       $(".category").text(data["category"]["name"]);
//     });
//   })
//
//
//   $(".submit").on("click", function(event) {
//     event.preventDefault()
//     $.ajax({
//       url: '/activities',
//       method: 'POST',
//       data: $(this).serialize(),
//       success: function(data) {
//         $('#acitivity_list').append(`<li>${data.content}</li>`)
//       }
//     })
//     // var url = $(this).data["url"]
//     // console.log(url)
//     // $.get(url), function(response) {
//     //   console.log(response)
//   })
//   })
//     // $.post($(this).attr('action', $(this).serialize(), function(response) {
//     //   var activityId = parseInt($(this).attr('data-id'))
//     //   $.get("/users/" + userId + "/activities/" + activityId + ".json", function(data) {
//     //     $(".title").text(data["title"]);
//     //     $(".description").text(data["description"]);
//     //     $(".goal").text(data["goal"]);
//     //     $(".rules").text(data["rules"]);
//     //     $(".time").text(data["time"]);
//     //     $(".category").text(data["category"]["name"]);
//     // }, 'json')
//     // $('form :input').attr('value', '')
//
// //close doc.ready
