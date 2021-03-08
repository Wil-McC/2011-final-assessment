require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'relationships' do
    it { should have_many :surgery_doctors }
    it { should have_many(:surgeries).through(:surgery_doctors) }
  end
  describe 'class methods' do
    before :each do
      @ban = Doctor.create!(name: 'Iban Thao', years_practiced: 12, university: 'Narnia U')
      @per = Doctor.create!(name: 'Perc Eben', years_practiced: 10, university: 'Ibuen GS')
      @dor = Doctor.create!(name: 'Dorin Apple', years_practiced: 20, university: 'Harvard')
    end
    it 'Doctor::sorted_xp' do
      expect(Doctor.sorted_xp).to eq([@dor, @ban, @per])
    end
  end
end
