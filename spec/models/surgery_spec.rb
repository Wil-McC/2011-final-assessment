require 'rails_helper'

RSpec.describe Surgery, type: :model do
  describe 'relationships' do
    it { should have_many :surgery_doctors }
    it { should have_many(:doctors).through(:surgery_doctors) }
  end
end
