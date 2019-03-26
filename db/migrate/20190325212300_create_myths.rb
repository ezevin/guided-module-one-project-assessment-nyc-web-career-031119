class CreateMyths < ActiveRecord::Migration[5.2]
  def change
    create_table :myths do |t|
     t.string :name
     t.string :location
     t.string :origin_country
     t.text    :facts
     t.boolean :has_tail
     t.boolean :has_wings
     t.timestamps
   end
  end
end
