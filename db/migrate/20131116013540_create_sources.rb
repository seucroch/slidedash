class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :url
      t.integer :number_post
      t.boolean :active, default: true
      t.references :album

      t.timestamps
    end
     add_index :sources, :album_id

  end
end
