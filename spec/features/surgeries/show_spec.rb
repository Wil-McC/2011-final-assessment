require 'rails_helper'

RSpec.describe 'the surgery show page' do
  before :each do
    @org = Surgery.create!(title: 'Organ Transplants', weekday: 'Wednesday', or_number: 25)

    @ban = Doctor.create!(name: 'Iban Thao', years_practiced: 12, university: 'Narnia U')
    @per = Doctor.create!(name: 'Perc Eben', years_practiced: 10, university: 'Ibuen GS')
    @dor = Doctor.create!(name: 'Dorin Apple', years_practiced: 20, university: 'Harvard')

    @org.doctors << [@dor, @ban, @per]
  end
  it 'displays title day and OR number' do
    visit surgery_path(@org)

    expect(page).to have_content('Organ Transplants')
    expect(page).to have_content('Wednesday')
    expect(page).to have_content('25')
  end
  it "displays all doctors assigned with years_practiced" do
    visit surgery_path(@org)

    within('.all-docs') do
      expect(page).to have_content('Iban Thao - 12 years')
      expect(page).to have_content('Perc Eben - 10 years')
      expect(page).to have_content('Dorin Apple - 20 years')
    end
  end
  it "has a most and least experienced doc section with 1 doc in each" do
    visit surgery_path(@org)

    within('.most') do
      expect(page).to have_content('Most Experienced Doctor')
    end
    within('.least') do
      expect(page).to have_content('Least Experienced Doctor')
    end
  end
end
