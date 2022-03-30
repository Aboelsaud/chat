class AddColumnsToChatis < ActiveRecord::Migration[5.0]
  def change
    add_column :chatis, :chats_count, :integer
  end
end
