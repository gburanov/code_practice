class CreatePackages < ActiveRecord::Migration[4.2]
  def up
    create_table :packages do |t|
      t.string    :name
      t.string    :version
      t.datetime  :date
      t.string    :title
      t.string    :description
    end
    puts 'Packages table created'
  end

  def down
    drop_table :packages
    puts 'Packages table destroyed'
  end
end
