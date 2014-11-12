class Post < ActiveRecord::Base
	has_many :votes
	has_many :comments
	validates :url, presence: true
	validates_format_of :url, :with => URI.regexp
	validates :title, presence: true 
	validates :body, presence: true, length: {minimum: 10, maximum: 200}
end
