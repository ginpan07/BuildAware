class AddMoodsToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :mood, :string
  end
end
