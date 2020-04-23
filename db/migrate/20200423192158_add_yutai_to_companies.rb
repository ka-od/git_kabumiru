class AddYutaiToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :yutai, :float
  end
end
