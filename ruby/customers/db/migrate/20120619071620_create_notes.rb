class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :body
      t.belongs_to :customer

      t.timestamps
    end
    add_index :notes, :customer_id
  end
end
