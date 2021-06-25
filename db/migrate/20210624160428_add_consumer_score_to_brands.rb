class AddConsumerScoreToBrands < ActiveRecord::Migration[6.0]
  def change
    add_column :brands, :consumer_score, :float
  end
end
