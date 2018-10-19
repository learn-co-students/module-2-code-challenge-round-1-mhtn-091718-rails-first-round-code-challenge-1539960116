class HeroinesController < ApplicationController
  before_action :get_heroine, only: [:show, :edit, :destroy]
  def index
    if params["search"]
      @heroines = Heroine.where(:power_id => params["search"]["power_id"])
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
      redirect_to heroine_path(@heroine)
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end



  private
  def get_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end


end
