class CreateRateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :rate_movies do |t|
      t.references :rate, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
