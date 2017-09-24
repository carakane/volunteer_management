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


  $(".volunteers.show").ready(function () {
      $("#next").click(function(){
        var volunteers = $.get('/volunteers.json');
        var nextVol;
        volunteers.done(function(data){
          var id = document.getElementById("next").getAttribute("volunteer")
          for(i = 0; i< data.length; i++) {
            if (data[i]["id"] === parseInt(id)) {
              if (data[parseInt(`${i+1}`)]){
                nextVol = data[parseInt(`${i+1}`)]["id"]
                var getting = $.get('/volunteers/' + nextVol + '.json');
                getting.done(function(data){
                  $("#previous").prop("disabled", false)
                  $("#opportunities").empty()
                  loadVol(data["id"])
                })
              } else {
                $("#next").prop('disabled', true);
              }
            }
          }
        });
      });

      $("#previous").click(function(){
        var volunteers = $.get('/volunteers.json');
        var previousVol;
        volunteers.done(function(data){
          var id = document.getElementById("previous").getAttribute("volunteer")
          for(i = 0; i< data.length; i++) {
            if (data[i]["id"] === parseInt(id)) {
              if (data[parseInt(`${i-1}`)]){
                previousVol = data[parseInt(`${i-1}`)]["id"]
                var getting = $.get('/volunteers/' + previousVol + '.json');
                getting.done(function(data){
                  $("#next").prop("disabled", false)
                  $("#opportunities").empty()
                  loadVol(data["id"])
                })
              } else {
                $("#previous").prop('disabled', true);
              }
            }
          }
        });
      });


  function loadVol(id) {
    $("#next").attr({"volunteer": id})
    $("#previous").attr({"volunteer": id})
    document.getElementsByTagName("form")[0]["action"] = '/volunteers/'+ id +'/edit'
    document.getElementsByTagName("form")[1]["action"] = '/volunteers/'+ id
    // debugger;

    var getting = $.get('/volunteers/' + id + '.json');
    getting.done(function(data){
      var vol = new Volunteer(data["id"], data["name"])

      $.each(data.opportunities, function(k, v) {
        // debugger;
        var opp = new Opportunity(v["id"], v["name"], v["day"], v["status"])
        var html = opp.url()  + ' || Day: ' + opp.day  + ' || Status: ' + opp.status + '<br />'
        $("#opportunities").append(html)
      })

      var availability = new Availability(data.availability["id"], data.availability["volunteer_id"], data.availability["monday"], data.availability["tuesday"], data.availability["wednesday"], data.availability["thursday"], data.availability["friday"], data.availability["saturday"], data.availability["sunday"])
      $("#monday").text(availability.monday)
      $("#tuesday").text(availability.tuesday)
      $("#wednesday").text(availability.wednesday)
      $("#thursday").text(availability.thursday)
      $("#friday").text(availability.friday)
      $("#saturday").text(availability.saturday)
      $("#sunday").text(availability.sunday)

      $("#name").text(vol["name"])
      })
  };
  loadVol(window.location.pathname.substring(12))
})
