class Availability < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.integer :volunteer_id
      t.string :monday, null: false, default: false
      t.string :tuesday, null: false, default: false
      t.string :wednesday, null: false, default: false
      t.string :thursday, null: false, default: false
      t.string :friday, null: false, default: false
      t.string :saturday, null: false, default: false
      t.string :sunday, null: false, default: false
    end
  end
end
