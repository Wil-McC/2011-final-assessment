require 'rails_helper'

RSpec.describe 'the surgery show page' do
  before :each do
    @org = Surgery.create!(title: 'Organ Transplants', weekday: 'Wednesday', or_number: 25)

    @ban = Doctor.create!(name: 'Iban Thao', years_practiced: 12, university: 'Narnia U')
    @per = Doctor.create!(name: 'Perc Eben', years_practiced: 10, university: 'Ibuen GS')
    @dor = Doctor.create!(name: 'Dorin Apple', years_practiced: 20, university: 'Harvard')
    @hac = Doctor.create!(name: "Hatchi Ano", years_practiced: 15, university: 'Saobody Arc')

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
      expect(page).to have_content('Dorin Apple - 20 years')
    end
    within('.least') do
      expect(page).to have_content('Least Experienced Doctor')
      expect(page).to have_content('Perc Eben - 10 years')
    end
  end
  it "has an add doctor form field" do
    visit surgery_path(@org)

    within('#new_doc') do
      fill_in 'name', with: 'Hatchi Ano'
      click_on 'Add Doctor'
    end

    expect(current_path).to eq(surgery_path(@org))

    within('.all-docs') do
      expect(page).to have_content('Hatchi Ano - 15 years')
    end
  end
end
