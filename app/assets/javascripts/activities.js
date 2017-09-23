$(function () {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/activities/" + nextId + ".json", function(data) {
      $(".title").text(data["title"]);
      $(".description").text(data["description"]);
      $(".goal").text(data["goal"]);
      $(".rules").text(data["rules"]);
      $(".time").text(data["time"]);
      $(".category").text(data["category"]["name"]);
      // debugger
      $('.topic-div').html('')
      data.topics.forEach(function(topic) {
        $('.topic-div').append(topic.name + "<br>")
      })


      $(".js-next").attr("data-id", data["id"]);
    });
  });
});
