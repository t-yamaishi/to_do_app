class ChangeDataDeadlineToPost < ActiveRecord::Migration[6.1]
  def down
    remove_column :posts, :test, :datetime
  end
end
