$("#title").text(data.title);
$(".description").text(data.description);

$(function () {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.getJSON("/activities/" + nextId + "/activity_data", function(data) {
      $(".title").text(data["title"]);
      $(".description").text(data["description"]);
      // $(".postBody").text(data["description"]);
      // re-set the id to current on the link
      $(".js-next").attr("data-id", data["id"]);
    });
  });
});
