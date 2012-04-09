class AddMeToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :me, :string
    add_column :companies, :email, :string
  end
end