class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    @power = Power.find(params[:id])
    #code
  end

  private

  def heroine_params
    params.require(:power).permit(:name, :description)
    #code
  end
end
