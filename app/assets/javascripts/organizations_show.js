var ready = function () {
  var id = window.location.pathname.substring(15);
  var getting = $.get('/organizations/' + id + '.json');
  getting.done(function(data){
      var org = new Organization(data["id"], data["name"]);
      $("#organization").append(org["name"]);
      $.each(data["opportunities"], function(k, v) {
        var opp = new Opportunity(v["id"], v["name"], v["day"], v["status"], org["id"]);
        var html = opp.url()  + ' || Day: ' + opp.day  + ' || Status: ' + opp.status + '<br />';
        $("#opportunities").append(html);
      })
  });
}

$(document).ready(ready);
$(document).on('turbolinks:load', function() {;
  if($(".organizations.show").length > 0) {
    ready();
  }
})
