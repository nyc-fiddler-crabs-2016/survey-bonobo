  $(document).ready(function() {
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
});
