class PowersController < ApplicationController
  before_action :find_power, only: [:show, :edit, :update, :destroy]
    def index
      @powers = Power.all
    end


    def show

    end

    def new
      @power = Power.new
    end

    def create
      @power = Power.create(power_params)
      if @power.valid?
        redirect_to power_path(@power)
      else
        flash[:error] = @power.errors.full_messages
        redirect_to new_power_path
      end
    end

    def edit
      @powers = Power.all
    end

    def update
      if @power.update(power_params) #this returns boolean, if valid it will update
        redirect_to power_path(@power)
      else
        flash[:error] = @power.errors.full_messages
        redirect_to edit_power_path
      end
    end

    def destroy
      @power.destroy
      redirect_to powers_path
    end
  private

  def find_power
    @power = Power.find(params[:id])
  end

  def power_params
  params.require(:power).permit(:name, :description)
  end

end ##End
