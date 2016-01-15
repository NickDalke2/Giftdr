class Interest < ActiveRecord::Base
	# validates :name, presence: true 

	has_many :person_interests
	has_many :people, through: :person_interests
end
