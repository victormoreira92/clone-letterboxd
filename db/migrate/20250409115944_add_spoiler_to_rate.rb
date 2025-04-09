class AddSpoilerToRate < ActiveRecord::Migration[7.0]
  def change
    add_column :rates, :spoiler, :boolean
  end
end
