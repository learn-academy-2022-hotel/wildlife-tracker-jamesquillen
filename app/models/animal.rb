class Animal < ApplicationRecord
    has_many :animal_sightings
    validates :common_name, :scientific_binomial, presence: true
    validate :unique_names
    validates :common_name, uniqueness: true
    validates :scientific_binomial, uniqueness: true

    def unique_names
        if common_name == scientific_binomial
            errors.add( :common_name, 'Common name cannot be the same a scientific binomial')
            errors.add( :scientific_binomial, 'Common name cannot be the same a scientific binomial')
        end
    end

end
