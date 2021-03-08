require 'rails_helper'

RSpec.describe 'the doctor index page' do
  before :each do
    @dor = Doctor.create!(name: 'Dorin Apple', years_practiced: 20, university: 'Harvard')
    @ban = Doctor.create!(name: 'Iban Thao', years_practiced: 12, university: 'Narnia U')
    @per = Doctor.create!(name: 'Perc Eben', years_practiced: 10, university: 'Ibuen GS')
  end
  it '' do

  end
end
