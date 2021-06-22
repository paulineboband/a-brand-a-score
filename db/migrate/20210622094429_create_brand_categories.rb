class CreateBrandCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :brand_categories do |t|
      t.references :brand, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
