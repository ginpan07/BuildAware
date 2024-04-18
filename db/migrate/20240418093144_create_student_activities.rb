class CreateStudentActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :student_activities do |t|
      t.string :activities
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
