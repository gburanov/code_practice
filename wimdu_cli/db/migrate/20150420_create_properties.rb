class CreateProperties < ActiveRecord::Migration

  def up
    create_table :properties, {id: false } do |t|
      t.string    :name, :primary_key => true
      t.string    :title
      t.string    :property_type
      t.string    :address
      t.string    :email
      t.string    :phone_number
      t.integer   :nightly_rate
      t.integer   :guests
    end
    puts 'ran up method'
  end

  def down
    drop_table :properties
    puts 'ran down method'
  end

end