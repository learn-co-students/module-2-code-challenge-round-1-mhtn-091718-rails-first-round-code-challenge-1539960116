class HeroinesController < ApplicationController

  before_action :find_heroine, only: [:show,:edit,:update,:destroy]

  def index
    @heroines = Heroine.all
  end

  def show

  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if(@heroine.valid?)
      redirect_to @heroine
    else
      flash[:error] = @heroine.errors.full_messages
      @powers = Power.all
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    #STROOOONG PARAMS ( you aint hackin me boi)
    params.require(:heroine).permit(:name, :power_id, :super_name)
  end

end
