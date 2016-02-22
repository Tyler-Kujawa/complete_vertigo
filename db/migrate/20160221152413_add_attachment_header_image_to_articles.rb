class AddAttachmentHeaderImageToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :header_image
    end
  end

  def self.down
    remove_attachment :articles, :header_image
  end
end
