class ChangeDayColumnsTypeAvailablity < ActiveRecord::Migration
  def change
    change_column :availabilities, :monday, :boolean, default: false
    change_column :availabilities, :tuesday, :boolean, default: false
    change_column :availabilities, :wednesday, :boolean, default: false
    change_column :availabilities, :thursday, :boolean, default: false
    change_column :availabilities, :friday, :boolean, default: false
    change_column :availabilities, :saturday, :boolean, default: false
    change_column :availabilities, :sunday, :boolean, default: false
  end
end
