class Park < ApplicationRecord
    has_and_belongs_to_many :address

    validates :park_name, :location_description, :neighbourhood, :location, presence: true
end
