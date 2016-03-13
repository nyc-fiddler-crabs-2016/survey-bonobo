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
  $('#login-button').on('click', function(event){
    event.preventDefault();

    var arguments = {
      type: 'GET',
      url: '/login',
      data: $(this).serialize()
    }
    $.ajax(arguments).done(function(response){
    $("#login-anchor").html(response).toggle()
    $("#register-anchor").hide();
    })
  })
  $('#register-button').on('click', function(event){
    event.preventDefault();

    var arguments = {
      type: 'GET',
      url: '/users/new',
      data: $(this).serialize()
    }
    $.ajax(arguments).done(function(response){
      $("#register-anchor").html(response).toggle()
      $("#login-anchor").hide();
    })
  })
  // var counter = 1
  // $(".survey-container").on("submit","question"+counter, function(){
  //     counter ++
  //     $("#question" + counter ).show();
  //     $("#question" + (counter - 1)).hide();
  // })

});


