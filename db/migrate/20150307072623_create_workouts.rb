class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :exercise
      t.integer :reps
      t.integer :weight

      t.timestamps
    end
  end
end
