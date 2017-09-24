var ready = function () {
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
};

$(document).ready(ready);
$(document).on('turbolinks:load', function() {;
  if($(".organizations.new").length > 0) {
    ready();
  }
})
