class SurgeriesController < ApplicationController
  before_action :set_surgery, only: [:show]

  def show
  end

  def index
    @surgeries = Surgery.all
  end

  private

  def set_surgery
    @surgery = Surgery.find(params[:id])
  end
end
