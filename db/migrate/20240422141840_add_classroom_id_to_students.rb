class AddClassroomIdToStudents < ActiveRecord::Migration[7.1]
  def change
    add_reference :students, :classroom, null: false, foreign_key: true
  end
end
