class CreateMantainers < ActiveRecord::Migration
  def up
    create_table :mantainers do |t|
      t.string    :email
      t.string    :name
      t.integer   :package_id
    end
    puts "mantainers table created"
  end

  def down
    drop_table :mantainers
    puts "mantainers table destroyed"
  end

end
