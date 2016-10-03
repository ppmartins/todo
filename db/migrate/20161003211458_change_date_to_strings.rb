class ChangeDateToStrings < ActiveRecord::Migration
  def change
    change_column :goals, :year,  :string
    change_column :goals, :month,  :string
  end
end
