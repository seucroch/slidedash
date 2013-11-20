class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :transition_time, :default => 500
      t.boolean :public, default: true
      t.string :category

      t.timestamps
    end
  end
end
