class AddPointsToPirateHunt < ActiveRecord::Migration
  def change
    add_column :pirate_hunts, :points, :integer
  end
end
