class Opportunity < ActiveRecord::Base
  belongs_to :organization
  belongs_to :volunteer
  validates :name, presence: true
  validates :organization_id, presence: true
  enum status: [:open, :assigned, :completed]
  enum day: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
  #another way to declare enum
  #enum status: {open: 0, assigned: 1, completed: 2}
  #http://api.rubyonrails.org/v4.1.0/classes/ActiveRecord/Enum.html

  scope :most_recent, -> {order("created_at desc")}
  scope :by_organization, -> organization_id {where(organization_id: organization_id)}

  def opportunity_match
    availabilities = Availability.where("#{self.day}": true)
    availabilities.select{|availability| availability.volunteer.opportunities.pluck(:status) != [1]}.collect{|availability| availability.volunteer}
    # binding.pry
    # availabilities.collect do |availability|
    #   availability.volunteer unless availability.volunteer.opportunities.pluck(:status) == [1]

# availabilities.collect do |availability|
#   if availability.volunteer.opportunities.pluck(:status) != [1]
#     availability.volunteer
#   end
# end


  end


end
