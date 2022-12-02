class AddColumnPosts < ActiveRecord::Migration[6.1]
  def up
    add_column :posts, :deadline, :time
  end

  def down
  end
end
