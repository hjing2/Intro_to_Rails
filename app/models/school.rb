class School < ApplicationRecord
    has_and_belongs_to_many :addresses

    validates :school, :street_name, presence: true
end
