class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.string :url
      t.string :title
      t.string :shortening
      t.integer :site_id

      t.timestamps
    end
  end
end
