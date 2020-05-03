class AddHanteiToCompanys < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :rimawari_hantei, :string
    add_column :companies, :syuekisei_hantei, :string
    add_column :companies, :wariyasudo_hantei, :string
    add_column :companies, :sougou_hantei, :string
  end
end
