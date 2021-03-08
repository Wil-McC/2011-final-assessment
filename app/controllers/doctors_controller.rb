class DoctorsController < ApplicationController


  def index
    @doctors = Doctor.sorted_xp
  end

end
