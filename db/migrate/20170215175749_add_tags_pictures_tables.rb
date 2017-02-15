class AddTagsPicturesTables < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.integer :owner_id

      t.timestamps
    end

    create_table :tags do |t|
      t.string :title
      t.integer :user_id
      t.integer :picture_id

      t.timestamps
    end
  end
end
