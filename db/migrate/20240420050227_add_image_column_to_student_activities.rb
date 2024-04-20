class AddImageColumnToStudentActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :student_activities, :image, :string
  end
end
