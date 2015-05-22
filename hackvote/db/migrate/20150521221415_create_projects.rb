class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :creators, null: false
      t.references :event, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
    add_index :projects, [:event_id, :created_at]
  end
end
