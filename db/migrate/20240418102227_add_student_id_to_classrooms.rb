class AddStudentIdToClassrooms < ActiveRecord::Migration[7.1]
  def change
    add_reference :classrooms, :student, null: false, foreign_key: true
  end
end
