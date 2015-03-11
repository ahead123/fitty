class AddWorkoutIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :workout_id, :integer
  end
end
