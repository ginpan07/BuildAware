class FixColumnNames < ActiveRecord::Migration[7.1]
  def change
    rename_column :moods, :moods, :mood
    rename_column :student_activities, :activities, :activity
  end
end
