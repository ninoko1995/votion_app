class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :name
      t.boolean :admin, default: :false
      t.timestamps null: false
    end
  end
end
