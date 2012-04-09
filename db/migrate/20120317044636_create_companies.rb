class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.has_attached_file :logo
      t.timestamps
    end
  end
end
