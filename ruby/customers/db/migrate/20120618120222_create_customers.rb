class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name, :null => false
      t.string :last_name,  :null => false
      t.string :street
      t.string :city
      t.string :postcode
      t.string :email
      t.date   :birthday

      # automatically creates created_at and updated_at
      t.timestamps
    end

    add_index :customers, :birthday
  end
end
