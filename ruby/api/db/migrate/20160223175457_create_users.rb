class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string      :login, :null => false
      t.string      :password, :null => false
      t.string      :role

      t.timestamps
    end
  end
end
