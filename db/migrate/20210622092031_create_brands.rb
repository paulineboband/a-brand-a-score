class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.text :description
      t.string :website_url
      t.integer :overall_score
      t.integer :environmental_score
      t.integer :social_score
      t.integer :quality_score

      t.timestamps
    end
  end
end
