class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.string :name
      t.integer :organization_id
      t.integer :volunteer_id
      t.integer :status, default: 0
      t.integer :day, default: 0
      t.timestamps null: false
    end
  end
end
