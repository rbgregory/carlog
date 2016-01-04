class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :vote]
  helper_method :car_name, :log_total

  def show; end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.owner = current_user
    if @car.save
      flash[:notice] = "You have added a car."
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def log
    set_car
    @log = Log.new
    @log.car = @car
    @log.owner = @car.owner
  end

  def car_name
    "#{self.year} #{self.make} #{self.model}"
  end

  def log_total
    total = 0
    car.logs.each do |log|
      total += log.price
    end
    total
  end

private

  def set_car
    @car = Car.find params[:id]
  end

  def car_params
    params.require(:car).permit(:make, :model, :year, :state, :plate, :vin, :notes)
  end

end
