class PowersController < ApplicationController
  before_action :find_power, only: %w(show)

  def index
    @powers = Power.all
  end
  def show
  end


  private
  def heroine_params
    params.require(:power).permit(:name,:description)
  end

  def find_power
    @power = Power.find(params[:id])
  end
end
