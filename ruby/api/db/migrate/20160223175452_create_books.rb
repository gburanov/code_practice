class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.integer     :creator_id, :null => false
      t.string      :name, :null => false
      t.integer     :author_id, :null => false
      t.string      :about

      t.timestamps
    end
  end
end
