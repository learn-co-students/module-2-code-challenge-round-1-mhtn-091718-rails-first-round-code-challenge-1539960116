class HeroinesController < ApplicationController
  before_action :find_heroine, only: [:show]

  def index
    if !!params[:q]
      searched_power_name = params[:q]
      searched_power = Power.find_by(name: searched_power_name)
      @heroines = Heroine.where(power_id: searched_power.id)
    else
      @heroines = Heroine.all
    end
  end

  def show
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.create(heroine_params)

    if @heroine.valid?
      redirect_to @heroine
    else
      flash[:error] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id,:q)
  end

  def find_heroine
    @heroine = Heroine.find(params[:id])
  end

end ### End of HeroinesController
