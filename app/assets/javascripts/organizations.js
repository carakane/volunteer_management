$(".organizations.index").ready(function () {
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


  $(".organizations.show").ready(function () {
    var id = $("a[id^='id-']")[0]["id"].substring(3)
    var getting = $.get('/organizations/' + id + '.json');
    getting.done(function(data){
        var org = new Organization(data["id"], data["name"]);
        var editButton = $('<%= button_to "Edit", edit_organization_path(@organization), :method => 'get' %>')
        var deleteButton = $('<%= button_to "Delete", organization_path(@organization), :method => 'delete' %>');

        $.each(data["opportunities"], function(k, v) {
          var opp = new Opportunity(v["id"], v["name"], v["day"], v["status"], org["id"])
          var html = opp.url()  + ' || Day: ' + opp.day  + ' || Status: ' + opp.status + '<br />'
          $("#opportunities").append(html)
        })
        $("#organization").append(org["name"], editButton, deleteButton)
    });
  })
