  $(".organizations.show").ready(function () {
    var id = $("body")[0]["id"];
    var getting = $.get('/organizations/' + id + '.json');
    getting.done(function(data){
        var org = new Organization(data["id"], data["name"]);

        $.each(data["opportunities"], function(k, v) {
          var opp = new Opportunity(v["id"], v["name"], v["day"], v["status"], org["id"]);
          var html = opp.url()  + ' || Day: ' + opp.day  + ' || Status: ' + opp.status + '<br />';
          $("#opportunities").append(html);
        })
        $("#organization").append(org["name"]);
    });
  })
