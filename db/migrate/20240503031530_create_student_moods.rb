class CreateStudentMoods < ActiveRecord::Migration[7.1]
  def change
    create_table :student_moods do |t|
      t.references :student, null: false, foreign_key: true
      t.references :mood, null: false, foreign_key: true

      t.timestamps
    end
  end
end
