function Organization(id, name) {
  this.id = id;
  this.name = name;
  this.url = function toUrl() {
    return('<a href="/organizations/' + this.id + '">' + this.name + '</a><br />');
  }
}

function Opportunity(id, name, day, status, organization) {
  this.id = id;
  this.name = name;
  this.day = day;
  this.status = status;
  this.organization = organization;
  this.url = function toUrl() {
    return('<a href="/organizations/' + this.organization + '/opportunities/' + this.id + '">' + this.name + '</a>')
  }
}

function Volunteer(id, name) {
  this.id = id;
  this.name = name;
  this.url = function toUrl() {
    return('<a href="/volunteers/' + this.id + '">' + this.name + '</a><br />');
  }
}

function Availability(id, volunteer_id, monday, tuesday, wednesday, thursday, friday, saturday, sunday) {
  this.id = id;
  this.volunteer_id = volunteer_id;

  function dayAvailable(day) {
    if (day === true) {
      return("Yes")
    } else {
      return("No")
  }};

  this.monday = dayAvailable(monday)
  this.tuesday = dayAvailable(tuesday);
  this.wednesday = dayAvailable(wednesday);
  this.thursday = dayAvailable(thursday);
  this.friday = dayAvailable(friday);
  this.saturday = dayAvailable(saturday);
  this.sunday = dayAvailable(sunday);
}
//
// function VolunteerSkills(id, volunteer_id, :name) {
//
// }
