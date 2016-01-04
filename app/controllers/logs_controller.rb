class LogsController < ApplicationController

  def show; end

  def new
    @log = Log.new
    @car = Car.find(params[:car_id])
  end

  def create
    @car = Car.find(params[:car_id])
    #@log = Log.new(params.require(:log).permit(:log))
    #@log.car = @car
    #@log = @car.logs.build(params.require(:log).permit(:log)) #this line replace the above two
    @log = Log.new(log_params)
    @log.owner = current_user
    @log.car = @car

    if @log.save
      flash[:notice] = 'Your log was added.'
      redirect_to car_path(@car)
    else
      render 'logs/new'
    end
  end

  def edit
    binding.pry
    @log = Log.find(params[:id])
    @car = Car.find(params[:car_id])
  end

  private

  def log_params
    params.require(:log).permit(:date, :mileage, :vendor, :price, :description)
  end

end
