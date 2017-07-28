class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.integer :creator_id, :null => false
      t.string  :name, :null => false
      t.text    :biography

      t.timestamps
    end
  end
end
