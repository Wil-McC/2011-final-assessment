require 'rails_helper'

RSpec.describe 'the surgery index page' do
  before :each do
    @org = Surgery.create!(title: 'Organ Transplants', weekday: 'Wednesday', or_number: 25)
    @hip = Surgery.create!(title: 'Hip Surgery', weekday: 'Tuesday', or_number: 12)

    @ban = Doctor.create!(name: 'Iban Thao', years_practiced: 12, university: 'Narnia U')
    @per = Doctor.create!(name: 'Perc Eben', years_practiced: 10, university: 'Ibuen GS')
    @dor = Doctor.create!(name: 'Dorin Apple', years_practiced: 20, university: 'Harvard')
    @hac = Doctor.create!(name: "Hatchi Ano", years_practiced: 15, university: 'Saobody Arc')

    @org.doctors << [@dor, @ban, @per]
    @hip.doctors << [@hac, @per]
  end
  it 'displays each surgery with info' do
    visit surgeries_path

    within("#surgery-#{@org.id}") do
      expect(page).to have_content('Organ Transplants')
      expect(page).to have_content('Wednesday')
      expect(page).to have_content('25')
    end
    within("#surgery-#{@hip.id}") do
      expect(page).to have_content('Hip Surgery')
    end
  end
  xit "by each surgery displays avg years practiced of associated doctors" do
    visit surgeries_path

    within("#surgery-#{@org.id}") do
      expect(page).to have_content('Average Years Practiced: 14')
    end
  end
end
