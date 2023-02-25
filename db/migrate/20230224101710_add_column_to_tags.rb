class AddColumnToTags < ActiveRecord::Migration[6.1]
  def change
    add_reference :tags, :user, foreign_key: true, null: false
  end
end
