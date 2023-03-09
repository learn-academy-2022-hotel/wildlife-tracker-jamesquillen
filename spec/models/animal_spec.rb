require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'must include a common name' do
    fido = Animal.create
    expect(fido.errors[:common_name] && fido.errors[:scientific_binomial]).to_not be_empty
  end

  it 'does not allow common_name and scientific_binomial to be the same in a single record' do
    kitty = Animal.create common_name: 'cat', scientific_binomial: 'cat'
    expect(kitty.errors[:common_name]).to_not be_empty
  end

  it 'does not allow duplicate values for common_name or scientific_binomial throughout the table' do
    Animal.create common_name: 'cat', scientific_binomial: 'feline'
    kitty = Animal.create common_name: 'cat', scientific_binomial: 'feline'
    expect(kitty.errors[:commmon_name] && kitty.errors[:scientific_binomial]).to_not be_empty
  end
  
end
