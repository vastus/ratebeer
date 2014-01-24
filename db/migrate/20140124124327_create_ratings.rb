class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score
      t.references :beer, index: true

      t.timestamps
    end
  end
end

