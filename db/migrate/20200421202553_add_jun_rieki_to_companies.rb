class AddJunRiekiToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :jun_rieki, :float
  end
end
