class DropBanklinesTableAgain < ActiveRecord::Migration
  def up
  	drop_table :banklines
  end

  def down
  end
end
