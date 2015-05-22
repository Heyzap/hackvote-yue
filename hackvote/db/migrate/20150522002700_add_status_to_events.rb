class AddStatusToEvents < ActiveRecord::Migration
  def change
    add_column :events, :completed, :boolean, default: false
  end
  add_index :projects, [:completed]
end
