class Opportunity < ActiveRecord::Base
  belongs_to :organization
  belongs_to :volunteer
  validates :name, presence: true
  validates :organization_id, presence: true
  enum status: [:open, :assigned, :completed]
  enum day: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
  #enum status: {open: 0, assigned: 1, completed: 2}

  scope :by_volunteer, -> volunteer_id {where(volunteer_id: volunteer)}
  scope :by_organization, -> organization_id {where(organization_id: organization)}
  #
  # def self.open_opportunities
  #   where("status = ?", self.statuses[:open])
  # end
  #
  # def self.completed_opportunities
  #   where("status = ?", self.statuses[:completed])
  # end
  #
  # def self.assigned_opportunities
  #   where("status = ?", self.statuses[:assigned])
  # end
  #
  # def self.which_volunteers
  # end

  def opportunity_match?
    @volunteers = []
    a = Availability.where("#{self.day}": "true")
    a.each do |av|
      @volunteers << av.volunteer unless av.volunteer.opportunities.pluck(:status) == [1]
    end
    @volunteers
end
end

#http://api.rubyonrails.org/v4.1.0/classes/ActiveRecord/Enum.html
