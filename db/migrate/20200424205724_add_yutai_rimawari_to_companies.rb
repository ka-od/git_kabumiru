class AddYutaiRimawariToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :Yutai_rimawari, :float
  end
end
