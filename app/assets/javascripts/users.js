$(document).ready(function() {
  $(".activityForm").hide()
  $(".showActivity").hide()

  $("#create_link").on("click", function(event){
    event.preventDefault()
    $(".activityForm").toggle();
  })

  $('#activity_list').on("load", function() {
    var userId = parseInt($("#username").attr("data-id"));
    $.get('/users/' + userId + ".json", function(data) {
    $("#activity_list").html('')
    data.activities.forEach(function(activity) {
      $("#activity_list").append(`<li><a class='link' data-id="${activity.id}" href="/users/${user.id}/activities/${activity.id}">${activity.title}</a><br></li>`)
    })
    })
  })


  $('#activity_list').on("click", '.link', function() {
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
      //Topics
      $('.topic-div').html('')
      data.topics.forEach(function(topic) {
        $('.topic-div').append(topic.name + "<br>")
      })
    });
  })

  $('.submit').on("click", function(event) {
    event.preventDefault()
    var activity = $("form").serialize()
    var activities = $.post("/activities", activity, null, "json").done(function(data) {
      newActivity = new Activity(data.id, data.title, data.description, data.goal, data.rules, data.time, data.category_id, data.topics_attributes )
      var activityHtml = newActivity.formatShowLink()
      $('#activity_list').append(activityHtml)
      // $('.showActivity').html("")
      // var activityShowHtml = newActivity.formatShow()
      // $('.showActivity').html(activityShowHtml)
      // $('.showActivity').show()
    }).fail(function(data){
      debugger
    })
  })
})

function Activity(id, title, description, goal, rules, time, category_id, topics_attributes) {
  this.id = id
  this.title = title
  this.description = description
  this.goal = goal
  this.rules = rules
  this.time = time
  this.category_id = category_id
  this.topics_attributes = topics_attributes
}

Activity.prototype.formatShowLink = function() {
  var userId = parseInt($("#username").attr("data-id"));
  var activityHtml = `
  <li><a class='link' data-id="${this.id}" href="/users/${userId}/activities/${this.id}">${this.title}</a><br></li>
  `
  return activityHtml
}

Activity.prototype.formatShow = function() {
  var activityShowHtml = `
  <h3 class="title"> ${this.title} </h3>
  <h5>Description: </h5>
  <p class="description">${this.description}</p>
  <h5>Goal: </h5>
  <p class="goal">${this.goal}</p>
  <h5>Rules: </h5>
  <p class="rules">${this.rules}</p>
  <h5>Time Needed:</h5>
  <p class="time">${this.time} minutes</p>
  <h5>Category:</h5>
  <p class="category">${this.category.id}</p>
  <h5>Topics:</h5>
  <p class="topics">${this.topic.name}</p>
  <br><br>
  `
  return activityShowHtml
}
