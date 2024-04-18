class RemoveClassroomIdFromStudents < ActiveRecord::Migration[7.1]
  def change
    remove_reference :students, :classroom, null: false, foreign_key: true
  end
end
