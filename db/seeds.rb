# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
  Volunteer.new(
    name: Faker::Name.unique.name,
    ).build_availability(
    monday: [true, false].sample,
    tuesday: [true, false].sample,
    wednesday: [true, false].sample,
    thursday: [true, false].sample,
    friday: [true, false].sample,
    saturday: [true, false].sample,
    sunday: [true, false].sample
    ).save
end

10.times do
  Organization.create(
    name: Faker::Company.unique.name,
    user_id: 1
  )
  Opportunity.create(
    name: Faker::Job.title,
    organization_id: Faker::Number.between(1, 10),
    volunteer_id: Faker::Number.between(1, 20),
    day: [0, 1, 2, 3, 4, 5, 6].sample,
    status: [1, 2].sample
  )
  Opportunity.create(
    name: Faker::Job.title,
    organization_id: Faker::Number.between(1, 10),
    day: [0, 1, 2, 3, 4, 5, 6].sample,
    status: 0
  )
end
