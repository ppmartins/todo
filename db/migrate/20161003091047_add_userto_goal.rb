class AddUsertoGoal < ActiveRecord::Migration
  def change
    add_reference :goals, :user, index: true
    add_foreign_key :goals, :users
  end
end
