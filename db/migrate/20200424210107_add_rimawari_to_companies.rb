class AddRimawariToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :yutai_rimawari, :float
    add_column :companies, :haitou_rimawari, :float
  end
end
