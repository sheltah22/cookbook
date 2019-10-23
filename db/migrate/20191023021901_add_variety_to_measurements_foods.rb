class AddVarietyToMeasurementsFoods < ActiveRecord::Migration[5.2]
  def change
    add_reference :measurements, :variety, foreign_key: true
    add_reference :foods, :variety, foreign_key: true
  end
end
