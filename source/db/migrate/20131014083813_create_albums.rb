class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
    	t.string :title
    	t.integer :status
    	t.string :album_photo_file_name
        t.string :album_photo_content_type
        t.integer :album_photo_file_size
        t.datetime :album_photo_updated_at
    	t.timestamps
    end
  end
end
