class RemoveActivitiesFromStudentActivity < ActiveRecord::Migration[7.1]
  def change
    add_reference :student_activities, :activity, null: false, foreign_key: true
    remove_column :student_activities, :activities
  end
end
