require 'rails_helper'

RSpec.describe Surgery, type: :model do
  describe 'relationships' do
    it { should have_many :surgery_doctors }
    it { should have_many(:doctors).through(:surgery_doctors) }
  end
  describe 'instance methods' do
    before :each do
      @org = Surgery.create!(title: 'Organ Transplants', weekday: 'Wednesday', or_number: 25)

      @ban = Doctor.create!(name: 'Iban Thao', years_practiced: 12, university: 'Narnia U')
      @per = Doctor.create!(name: 'Perc Eben', years_practiced: 10, university: 'Ibuen GS')
      @dor = Doctor.create!(name: 'Dorin Apple', years_practiced: 20, university: 'Harvard')

      @org.doctors << [@dor, @ban, @per]
    end
    it '#most_xp' do
      expect(@org.most_xp).to eq(@dor)
    end
    it "#least_xp" do
      expect(@org.least_xp).to eq(@per)
    end
  end
end
