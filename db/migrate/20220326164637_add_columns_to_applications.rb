class AddColumnsToApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :chats_count, :integer
  end
end
