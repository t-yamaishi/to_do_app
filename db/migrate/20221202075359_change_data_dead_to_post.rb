class ChangeDataDeadToPost < ActiveRecord::Migration[6.1]
  def up
    add_column :posts, :deadline, :datetime
  end
end
