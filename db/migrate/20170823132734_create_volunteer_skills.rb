class CreateVolunteerSkills < ActiveRecord::Migration
  def change
    create_table :volunteer_skills do |t|
      t.integer :volunteer_id
      t.integer :skill_id
    end
  end
end
