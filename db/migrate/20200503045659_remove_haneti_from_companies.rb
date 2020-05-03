class RemoveHanetiFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :rimawari_hantei, :boolean
    remove_column :companies, :syuekisei_hantei, :boolean
    remove_column :companies, :wariyasudo_hantei, :boolean
    remove_column :companies, :sougou_hantei, :boolean
  end
end
