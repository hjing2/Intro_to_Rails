class Park < ApplicationRecord
    belongs_to :address

    validates :park_name, :address, :location_description, :neighbourhood, :location, presence: true
end
