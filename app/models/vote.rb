class Vote < ActiveRecord::Base
	belongs_to :post, counter_cache: true # this makes sure the post table's vote count is updated
	validates :ip_address, uniqueness: { scope: :post}
end
 