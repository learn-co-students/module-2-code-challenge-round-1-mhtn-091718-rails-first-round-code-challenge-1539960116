class PowersController < ApplicationController
  before_action :find_id, only: [:show]

  def index
    @powers = Power.all
  end

  def show
  end

  private

  def find_id
    @power = Power.find(params[:id])
  end

end
