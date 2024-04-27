class FixColumnNames < ActiveRecord::Migration[7.1]
  def change
    rename_column :activities, :moods, :mood
  end
end
