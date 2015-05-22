class AddVotesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :votes, :int, default: 0
  end
end
