class Enterprise < ApplicationRecord
	has_many :comments, dependent: :destroy
end
