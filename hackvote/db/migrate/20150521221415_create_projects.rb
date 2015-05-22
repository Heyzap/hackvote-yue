class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :creators
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :projects, [:event_id, :created_at]
  end
end
