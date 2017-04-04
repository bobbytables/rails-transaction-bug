class CreateBunks < ActiveRecord::Migration
  def change
    create_table :bunks do |t|
      t.string :hello

      t.timestamps null: false
    end
  end
end
