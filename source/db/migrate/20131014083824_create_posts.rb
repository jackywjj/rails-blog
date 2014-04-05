class CreatePosts < ActiveRecord::Migration
    def change
        create_table :posts do |t|
            t.string :title
            t.string :post_image_file_name
            t.string :post_image_content_type
            t.integer :post_image_file_size
            t.datetime :post_image_updated_at
            t.text :summary
            t.text :content
            t.integer :status
            t.integer :created_month
            t.references :category, :index => true
            t.timestamps
        end
    end 
end