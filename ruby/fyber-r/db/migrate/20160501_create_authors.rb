class CreateAuthors < ActiveRecord::Migration
  def up
    create_table :authors do |t|
      t.string    :email
      t.string    :name
      t.integer   :package_id
    end
    puts "Authors table created"
  end

  def down
    drop_table :authors
    puts "Authors table destroyed"
  end

end
