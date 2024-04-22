class ChangeClassroomIdToNullableInStudents < ActiveRecord::Migration[7.1]
  def change
    change_column :students, :classroom_id, :bigint, null: true
  end
end
