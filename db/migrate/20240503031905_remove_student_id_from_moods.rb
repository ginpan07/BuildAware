class RemoveStudentIdFromMoods < ActiveRecord::Migration[7.1]
  def change
    remove_column :moods, :student_id
  end
end
