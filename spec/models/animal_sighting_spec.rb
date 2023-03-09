require 'rails_helper'

RSpec.describe AnimalSighting, type: :model do
  it 'must include a latitude, longitude, and date' do
    sighting = AnimalSighting.create
    expect(sighting.errors[:latitude] && sighting.errors[:longitude] && sighting.errors[:date]).to_not be_empty
  end 
end
