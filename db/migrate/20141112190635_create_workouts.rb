class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date

      t.references :user
      t.references :sport

      t.timestamps
    end
  end
end
