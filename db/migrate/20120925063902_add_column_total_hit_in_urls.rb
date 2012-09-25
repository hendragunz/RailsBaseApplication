class AddColumnTotalHitInUrls < ActiveRecord::Migration
  def up
    add_column :urls, :total_hit, :integer, :default => 0
  end

  def down
    remove_column :urls, :total_hit
  end
end
