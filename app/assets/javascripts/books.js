// Generated by CoffeeScript 1.10.0
$(function() {
  $(".picture").click(function() {
    return alert("This is a picture");
  });
  $(".dropdown-menu").on('click', 'li', function() {
    var button, text, type;
    type = $(this).data('type');
    text = $(this).find('a').text();
    button = $(this).parent().siblings("button");
    button.data("type", type);
    button.find(".text").text(text);
    return $(this).closest("form").find(".search-field input").val("");
  });
  return $("#search-button").on('click', function() {
    var hash, type, value;
    type = $(this).closest("form").find(".btn-group button").data("type");
    value = $(this).closest("form").find(".search-field input").val();
    hash = {};
    hash[type] = value;
    return $.ajax({
      url: "fetch_books",
      dateType: "html",
      data: hash,
      success: function() {
        return console.log("successfully made a ajax call on fetch_books");
      }
    });
  });
});
