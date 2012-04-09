class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :auth_id
      t.string :name
      t.boolean :admin, :default => false
      t.timestamps
    end
  end
end
