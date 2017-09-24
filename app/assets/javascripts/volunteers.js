  $(".volunteers.new").ready(function () {
    $('form').submit(function(event) {
      event.preventDefault();
      var values = $(this).serialize();
      var posting = $.post('/volunteers', values);
      this.reset();
      posting.done(function(data) {
        var volunteer = new Volunteer(data["id"], data["name"]);

        var availability = new Availability(data.availability["id"], data.availability["volunteer_id"], data.availability["monday"], data.availability["tuesday"], data.availability["wednesday"], data.availability["thursday"], data.availability["friday"], data.availability["saturday"], data.availability["sunday"])
        $("#monday").text(availability.monday)
        $("#tuesday").text(availability.tuesday)
        $("#wednesday").text(availability.wednesday)
        $("#thursday").text(availability.thursday)
        $("#friday").text(availability.friday)
        $("#saturday").text(availability.saturday)
        $("#sunday").text(availability.sunday)

        debugger

        $("#volunteer").append(volunteer.url())
      });
    });
  });
