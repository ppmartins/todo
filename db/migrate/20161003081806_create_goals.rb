class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.date :year
      t.date :month
      t.text :goal1
      t.text :goal2
      t.text :goal3

      t.timestamps null: false
    end
  end
end
