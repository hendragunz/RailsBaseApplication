class AddColumnInUrl < ActiveRecord::Migration
  def up
    add_column :urls, :user_id, :integer
    add_column :urls, :public, :boolean
    add_index :urls, :user_id
  end

  def down
    remove_index :url, :user_id
    remove_column :url, :user_id
    remove_column :url, :public
  end
end
