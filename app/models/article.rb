class Article < ActiveRecord::Base
	has_attached_file :header_image, styles: { large: "700x412>", medium: "250x150", thumb: "100x100>" }
	validates_attachment_content_type :header_image, content_type: /\Aimage\/.*\Z/

	belongs_to :user

	def self.most_recent
		order("created_at desc").limit(5)
	end
end
