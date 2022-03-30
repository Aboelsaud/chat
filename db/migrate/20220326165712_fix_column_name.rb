class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :chatis, :chats_count, :messages_count
  end
end
