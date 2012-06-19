class DropBooklinesTable < ActiveRecord::Migration
  def up
  	drop_table :booklines
  end

  def down
  end
end
