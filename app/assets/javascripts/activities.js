$(function () {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.getJSON("/posts/" + nextId + "/post_data", function(data) {
      $(".authorName").text(data["author"]["name"]);
      $(".postTitle").text(data["title"]);
      $(".postBody").text(data["description"]);
      // re-set the id to current on the link
      $(".js-next").attr("data-id", data["id"]);
    });
  });
});