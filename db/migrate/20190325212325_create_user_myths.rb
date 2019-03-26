class CreateUserMyths < ActiveRecord::Migration[5.2]
  def change
    create_table :user_myths do |t|
      t.integer :user_id
      t.integer :myth_id
      t.float :rating
      t.timestamps
    end
  end
end
