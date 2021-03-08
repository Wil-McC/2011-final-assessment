class Surgery < ApplicationRecord
  has_many :surgery_doctors
  has_many :doctors, through: :surgery_doctors

  def most_xp
    doc = doctors.order(years_practiced: :DESC).limit(1).first
  end

  def least_xp
    doctors.order(:years_practiced).limit(1).first
  end
end
