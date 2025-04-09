class CreateRates < ActiveRecord::Migration[7.0]
  def change
    create_table :rates do |t|
      t.integer :stars
      t.references :movie, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :review

      t.timestamps
    end
  end
end
