class AddIsEdible < ActiveRecord::Migration[6.0]
  def change
    change_table :products do |t|
      t.boolean :edible
    end 
  end
end
