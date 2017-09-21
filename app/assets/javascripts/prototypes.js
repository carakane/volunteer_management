function Organization(id, name) {
  this.id = id;
  this.name = name;
  this.url = function toUrl() {
    return('<a href="/organizations/' + this.id + '">' + this.name + '</a><br />');
  }
}
