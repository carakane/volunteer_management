$(".organizations.index").ready(function () {
  debugger;
  var getting = $.get('/organizations.json');
  getting.done(function(data){
    $.each(data, function(k, v) {
      var org = new Organization(v["id"], v["name"])
      $("#organizations").append(org.url())
    });
  });
})

  $(".organizations.new").ready(function () {
    $('form').submit(function(event) {
      event.preventDefault();
      var values = $(this).serialize();
      var posting = $.post('/organizations', values);
      this.reset();
      posting.done(function(data) {
        var organization = new Organization(data["id"], data["name"]);
        $("#organization").append(organization.url())
      });
    });
  });


  $(".organizations.show #organization").ready(function () {
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
