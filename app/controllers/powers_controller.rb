class PowersController < ApplicationController
  before_action :get_power, only: [:show, :edit, :destroy]

  def index
    @powers = Power.all
  end

  def show

  end



  private
  def get_power
    @power = Power.find(params[:id])
  end

  def power_params
    params.reuire(:power).permit(:name, :description)
  end
end
