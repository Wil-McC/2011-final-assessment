class Doctor < ApplicationRecord
  has_many :surgery_doctors
  has_many :surgeries, through: :surgery_doctors

  def self.sorted_xp
    order(years_practiced: :desc)
  end

  def self.match(name)
    where('name ILIKE ?', "%#{name}%").first
  end
end
