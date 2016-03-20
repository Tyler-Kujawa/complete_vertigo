class Issue < ActiveRecord::Base
	has_attached_file :cover_image, styles: { medium: "250x400>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :cover_image, content_type: /\Aimage\/.*\Z/
	validates :issue_number, numericality: { only_integer: true }
	validates :rating, numericality: { only_integer: true }

	belongs_to :user

	def self.most_recent
		order("created_at desc").limit(3)
	end
end
