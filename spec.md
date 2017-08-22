# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
  - [ ] Rails gem required & used
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
  - [ ] User has_many Organizations
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  - [ ] Opportunity belongs_to Organization
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  - [ ] User has_many Volunteers through Opportunities
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  - [ ] volunteer.name
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  - [ ] User, Volunteer, Organization, Opportunity
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g.   User.most_recipes URL: /users/most_recipes)
  - [ ] Opportunity.by_organization(@user.organizations).most_recent.open, URL :/users/:id
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
  - [ ] URL: volunteers/new, writes to Volunteer and Availability (via custom availability_attributes=)
- [x] Include signup (how e.g. Devise)
  - [ ] Devise
- [x] Include login (how e.g. Devise)
  - [ ] Devise
- [x] Include logout (how e.g. Devise)
  - [ ] Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  - [ ] OmniAuth-Facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  - [ ] URL: /organizations/:id/opportunities/
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
  - [ ] URL: /organizations/:id/opportunities/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  - [ ] all forms display validation errors

Confirm:
- [x] The application is pretty DRY
  - [ ] yes
- [x] Limited logic in controllers
  - [ ] yes
- [x] Views use helper methods if appropriate
  - [ ] yes
- [x] Views use partials if appropriate
  - [ ] yes
