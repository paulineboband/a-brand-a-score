class ChangeIntegerToFloatInBrands < ActiveRecord::Migration[6.0]
  def change
    change_column :brands, :environmental_score, :float
    change_column :brands, :overall_score, :float
    change_column :brands, :social_score, :float
    change_column :brands, :quality_score, :float
  end
end
