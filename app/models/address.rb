class Address < ApplicationRecord
    has_many :parks, dependent: :destroy
    has_and_belongs_to_many :schools

    validates :street_name, :full_address, presence: true
end
