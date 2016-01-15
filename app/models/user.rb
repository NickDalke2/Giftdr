class User < ActiveRecord::Base
	has_many :reminders
	class << self
		def from_omniauth auth_hash
			user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider']) do |u|
				u.name = auth_hash['info']['name']
				u.image_url = auth_hash['info']['image']
				u.email = auth_hash['info']['email']
			end
		end
	end
	
end
