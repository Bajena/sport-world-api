class CreateSport < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :name, null: false
      t.integer :calories_per_hour, null: false
      t.boolean :requires_distance, null: false, default: false
    end
  end
end
