class RemoveDeadlineFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :deadline, :time
  end
end
