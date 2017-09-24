var ready = function () {
  debugger;
  var getting = $.get('/organizations' + '.json');
  getting.done(function(data){
    $.each(data, function(k, v) {
      var org = new Organization(v["id"], v["name"])
      $("#organizations").append(org.url())
    });
  });
}


$(document).ready(ready);
$(document).on('turbolinks:load', function() {;
  if($(".organizations.index").length > 0) {
    ready();
  }
})
