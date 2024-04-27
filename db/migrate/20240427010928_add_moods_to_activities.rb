class AddMoodsToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :moods, :string
  end
end
