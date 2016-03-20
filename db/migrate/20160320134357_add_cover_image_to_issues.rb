class AddCoverImageToIssues < ActiveRecord::Migration
  def self.up
    change_table :issues do |t|
      t.attachment :cover_image
    end
  end

  def self.down
    remove_attachment :issues, :cover_image
  end
end
