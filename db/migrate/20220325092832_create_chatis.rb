class CreateChatis < ActiveRecord::Migration[5.0]
  def change
    create_table :chatis do |t|
      t.string :name
      t.references :application, foreign_key: true

      t.timestamps
    end
  end
end
