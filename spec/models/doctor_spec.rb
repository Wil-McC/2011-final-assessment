require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'relationships' do
    it { should have_many :surgery_doctors }
    it { should have_many(:surgeries).through(:surgery_doctors) }
  end
end
