class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.integer :money, default: 0
      t.integer :liking, default: 0
      t.timestamps null: false
    end
  end
end
