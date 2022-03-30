class SetColumnDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column :applications, :chats_count, :integer, default: 0
    change_column :chatis, :messages_count, :integer, default: 0
  end
end
