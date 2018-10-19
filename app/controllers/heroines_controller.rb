class HeroinesController < ApplicationController
  before_action :find_heroine, only: [:show]

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
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to @heroine
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end


  private

  def heroine_params
    params.require(:heroine).permit(:power_id, :name, :super_name)
  end

  def find_heroine
    @heroine = Heroine.find(params[:id])
  end

end
