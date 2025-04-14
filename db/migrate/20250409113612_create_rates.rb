class CreateRates < ActiveRecord::Migration[7.0]
  def change
    create_table :rates do |t|
      t.integer :stars
      t.string :movie_id
      t.references :user, null: false, foreign_key: true
      t.text :review

      t.timestamps
    end
  end
end
