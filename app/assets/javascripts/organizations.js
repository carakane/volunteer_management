$(".organizations.index").ready(function () {
  var getting = $.get('/organizations.json');
  getting.done(function(data){
    $.each(data, function(k, v) {
      var org = new Organization(v["id"], v["name"])
      $("#organizations").append(org.url())
    });
  });
})
