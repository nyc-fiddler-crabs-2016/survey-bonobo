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

  $('.container').on('click', '.add-new-choice', function(event){
    event.preventDefault();
    var counter = Math.floor(Math.random() * 10000) + 1
    $('<input>').attr({
      type: 'text',
      name: 'choices[content' + counter + ']',
    }).appendTo('.new-choice');
    counter ++;
  });


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
      $("#choices-container").append(response);
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
  });

