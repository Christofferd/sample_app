class DropBanklinesTable < ActiveRecord::Migration
  def up
  end

  def down
  	drop_table :banklines
  end
end
