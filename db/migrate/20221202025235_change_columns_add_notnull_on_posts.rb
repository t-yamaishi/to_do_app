class ChangeColumnsAddNotnullOnPosts < ActiveRecord::Migration[6.1]
  def up
    change_column :posts, :content, :string, null: false
  end
  def down
  end
end
