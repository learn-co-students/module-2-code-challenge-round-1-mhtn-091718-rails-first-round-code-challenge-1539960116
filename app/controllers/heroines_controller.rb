class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    if Heroine.exists?(super_name: params[:heroine][:super_name])
      flash[:error] = "Super Name Already Exists."
      redirect_to new_heroine_path
    elsif params[:heroine][:power_id].empty? # Might Do this with Verify
      flash[:error] = "Must Select A Power"
      redirect_to new_heroine_path
    else
      @heroine = Heroine.create(heroine_params)
      redirect_to heroine_path(@heroine)
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name,:super_name,:power_id)
  end

end
