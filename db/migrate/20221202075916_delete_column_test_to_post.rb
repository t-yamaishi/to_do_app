class DeleteColumnTestToPost < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :test, :time
  end
end
