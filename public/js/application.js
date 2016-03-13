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
  $('.container').on('submit', '#new-question', function(event){
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

  $('.container').on('submit', '.new-choice', function(event){
    event.preventDefault();
    var url = "/choices";
    var data = $(this).serialize();
    $.ajax({
      type: "POST",
      url: url,
      data: data,
      dataType: "HTML"
    }).done(function(response){
      $(".new-choice").hide();
      $('.add-new-choice').hide();
      $(".container").append(response);
      var questionUrl = "/questions/new";
      var questionData = $(this).serialize();
      $.ajax({
        type: "GET",
        url: questionUrl,
        data: questionData,
        dataType: "HTML"
      }).done(function(response){
        $(".container").append(response);
      })
    })
  });
  $('.container').on('submit', '.add-new-choice', function(event){
    event.preventDefault();
    var url = "/choices";
    var data = $(this).serialize();
    $.ajax({
      type: 'GET',
      url: url,
      data: data,
      dataType: 'HTML'
    }).done(function(){
      $("#choices-container").prepend(response);


    })
  });

  // $('.container').on('submit', '.new-choice-button'), function(event){
  //   event.preventDefault();
  //   var url = '/choices'
  //   var data = $this.serialize();
  //   $.ajax({
  //     type: 'POST',
  //     url: url,
  //     data: data,
  //     dataType: 'HTML'
  //   }).done(function(response){
  //     $('.add-new-choice').hide();
  //     debugger
  //     $('.container').append(response);

  //   })
  // }

  // $('.new-choice-button').on("click", function(){
  //   $(".new-choice").each(function(){
  //     $(this).submit();
  //   })
  // });

});
