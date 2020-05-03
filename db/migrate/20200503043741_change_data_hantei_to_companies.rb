class ChangeDataHanteiToCompanies < ActiveRecord::Migration[5.2]
  def change
    change_column :companies, :rimawari_hantei, :boolean, default: false
    change_column :companies, :syuekisei_hantei, :boolean, default: false
    change_column :companies, :wariyasudo_hantei, :boolean, default: false
    change_column :companies, :sougou_hantei, :boolean, default: false
  end
end
