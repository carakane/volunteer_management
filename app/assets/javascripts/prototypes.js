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
}
