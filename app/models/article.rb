class Article < ActiveRecord::Base
	belongs_to :user

	has_attached_file :header_image, styles: { large: "300x300>", medium: "250x150", thumb: "100x100>" }
	validates_attachment_content_type :header_image, content_type: /\Aimage\/.*\Z/


	def self.most_recent
		order("created_at desc").limit("4")
	end
end
