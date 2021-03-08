require 'rails_helper'

RSpec.describe 'the doctor index page' do
  before :each do
    @ban = Doctor.create!(name: 'Iban Thao', years_practiced: 12, university: 'Narnia U')
    @per = Doctor.create!(name: 'Perc Eben', years_practiced: 10, university: 'Ibuen GS')
    @dor = Doctor.create!(name: 'Dorin Apple', years_practiced: 20, university: 'Harvard')
  end
  it 'displays all doctors with info' do
    visit doctors_path

    within("#doctor-#{@dor.id}") do
      expect(page).to have_content('Dorin Apple')
      expect(page).to have_content('20')
    end
    within("#doctor-#{@ban.id}") do
      expect(page).to have_content('Iban Thao')
      expect(page).to have_content('12')
    end
    within("#doctor-#{@per.id}") do
      expect(page).to have_content('Perc Eben')
      expect(page).to have_content('10')
    end
  end
  it "displays doctors from most experienced to least" do
    visit doctors_path

    expect(@dor.name).to appear_before(@ban.name)
    expect(@ban.name).to appear_before(@per.name)
    expect(@dor.name).to appear_before(@per.name)
  end
end
