class Availability < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.integer :volunteer_id
      t.boolean :monday, null: false, default: false
      t.boolean :tuesday, null: false, default: false
      t.boolean :wednesday, null: false, default: false
      t.boolean :thursday, null: false, default: false
      t.boolean :friday, null: false, default: false
      t.boolean :saturday, null: false, default: false
      t.boolean :sunday, null: false, default: false
    end
  end
end
