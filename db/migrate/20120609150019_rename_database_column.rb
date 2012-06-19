class RenameDatabaseColumn < ActiveRecord::Migration
  def up
  	rename_column(:banklines, :appendex_number, :appendix_number)
  end

  def down
  end
end
