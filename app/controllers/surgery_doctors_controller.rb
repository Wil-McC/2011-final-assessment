class SurgeryDoctorsController < ApplicationController
  before_action :set_surgery, only: [:create]

  def create
    doctor = Doctor.match(params[:name])
    @surgery.doctors << doctor

    redirect_to surgery_path(@surgery)
  end

  private

  def set_surgery
    @surgery = Surgery.find(params[:surgery_id])
  end
end
