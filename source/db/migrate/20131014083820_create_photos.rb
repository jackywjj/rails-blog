class CreatePhotos < ActiveRecord::Migration
    def change
        create_table :photos do |t|
            t.string :title
            t.string :photo_name_file_name
            t.string :photo_name_content_type
            t.integer :photo_name_file_size
            t.datetime :photo_name_updated_at
            t.integer :status
            t.references :album, :index => true

            t.timestamps
        end
    end
end