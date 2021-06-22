class AddLogoToBrands < ActiveRecord::Migration[6.0]
  def change
    add_column :brands, :logo, :string
  end
end
