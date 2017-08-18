# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  User.create(
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password
  )
  Volunteer.create(
    name: Faker::Name.name
  )
end

10.times do
  Organization.create(
    name: Faker::Company.name,
    user_id: Faker::Number.between(1, 10)
  )
  Opportunity.create(
    name: Faker::Job.title,
    organization_id: Faker::Number.between(1, 10),
    volunteer_id: Faker::Number.between(1, 10),
    day: [0, 1, 2, 3, 4, 5, 6].sample,
    status: [0, 1, 2].sample
  )
  Availability.create(
  volunteer_id: Faker::Number.between(1, 10),
  monday: ["true", "false"].sample,
  tuesday: ["true", "false"].sample,
  wednesday: ["true", "false"].sample,
  thursday: ["true", "false"].sample,
  friday: ["true", "false"].sample,
  saturday: ["true", "false"].sample,
  sunday: ["true", "false"].sample
  )
end
