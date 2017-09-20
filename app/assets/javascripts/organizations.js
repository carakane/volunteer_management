$('.organizations.index').ready(function () {
  var getting = $.get('/organizations.json');
  getting.done(function(data){
    $.each(data, function(k, v) {
      var html = '<a href="/organizations/' + data[k]["id"] + '">' + data[k]["name"] + '</a><br />';
      $("#organizations").append(html)
    });
  });
})
