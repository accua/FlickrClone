class AddFilesPicturesTable < ActiveRecord::Migration[5.0]
  def self.up
     change_table :pictures do |t|
       t.attachment :local_pic
     end
   end

   def self.down
     drop_attached_file :pictures, :local_pic
   end
 end
