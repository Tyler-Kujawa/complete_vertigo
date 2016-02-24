class Article < ActiveRecord::Base
	belongs_to :user

	has_attached_file :header_image, styles: { large: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :header_image, content_type: /\Aimage\/.*\Z/
end
