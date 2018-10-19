class HeroinesController < ApplicationController
  before_action :find_heroine, only: [:show]
  def index
    if !!params[:power_name]
      power = Power.find_by(name: params[:power_name])
      @heroines = power.heroines
    else
      @heroines = Heroine.all
    end
  end

  def show
  end

  def new
    @powers = Power.all
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      redirect_to heroine_path(@heroine)
    else
      flash[:error] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  def find_heroine
    @heroine = Heroine.find_by(id: params[:id])
  end

  def find_power_by_name

  end
end
