$(document).ready(function() {
  $("#new-survey").on("submit", function(event){
      event.preventDefault();
      var url = "/surveys";
      var data = $(this).serialize();
      $.ajax({
          type: "POST",
          url: url,
          data: data,
          dataType: "HTML"
      }).done(function(response){
        $("#new-survey").hide();
        $(".container").append(response);

      });
  });
  $('body').on('submit', '#new-question', function(event){
    event.preventDefault();
    var url = "/questions";
    var data = $(this).serialize();
    $.ajax({
      type: "POST",
      url: url,
      data: data,
      dataType: "HTML"
    }).done(function(response){
      $("#new-question").hide();
      $(".container").append(response);
    //  $("new-question").append(//new choices form);
    })
  })
});
