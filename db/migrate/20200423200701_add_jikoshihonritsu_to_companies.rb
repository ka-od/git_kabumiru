class AddJikoshihonritsuToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :jikoshihonritsu, :float
  end
end
