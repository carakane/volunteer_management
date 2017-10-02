const OrganizationService = {
  fetchAll() {
    $.get('/organizations' + '.json')
      .done(organizations => {
        $("#organizations").empty();
        this.sortAndRender(organizations)
      });
  },

  createAndRender(organization) {
    var org = new Organization(organization.id, organization.name)
    $("#organizations").append(org.url())
  },

  sortAndRender(organizations) {
     organizations
      .sort(sortByName)
      .forEach(this.createAndRender)
  }
}

function sortByName(a, b) {
 var nameA = a.name.toUpperCase();
 var nameB = b.name.toUpperCase();
 if (nameA < nameB) {
   return -1;
 }
 if (nameA > nameB) {
   return 1;
 }

 return 0;
}

$(document).ready(function(){
  OrganizationService.fetchAll()
});
