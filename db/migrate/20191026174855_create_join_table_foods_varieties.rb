class CreateJoinTableFoodsVarieties < ActiveRecord::Migration[5.2]
  def change
    remove_reference :foods, :variety, foreign_key: true
    create_join_table :foods, :varieties do |t|
      # t.index [:food_id, :variety_id]
      # t.index [:variety_id, :food_id]
    end
  end
end
