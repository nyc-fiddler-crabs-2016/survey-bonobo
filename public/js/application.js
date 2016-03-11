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
        $("#new-survey").html(response);

      });
  });
});
