class HeroinesController < ApplicationController
  before_action :find_id, only: [:show]

  def index
    @heroines = Heroine.all
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(strong_params)
    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      flash[:error] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  def show
  end

  private

  def find_id
    @heroine = Heroine.find(params[:id])
  end

  def strong_params
     params.require(:heroine).permit(:name,:super_name,:power_id)
  end
end
