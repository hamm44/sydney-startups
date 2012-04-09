class AddCurrentStateToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :current_state, :string, :default => 'pending'
  end
end
