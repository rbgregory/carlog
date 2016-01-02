class LogsController < ApplicationController

  def show; end

  def new
    @log = Log.new
  end

  def create
    @car = Car.find(params[:log][:car_id])
    #@log = Log.new(params.require(:log).permit(:log))
    #@log.car = @car
    #@log = @car.logs.build(params.require(:log).permit(:log)) #this line replace the above two
    @log = Log.new(log_params)
    @log.owner = current_user
    #@log.owner = current_user #User.first #need to fix this after authentication

    if @log.save
      flash[:notice] = 'Your log was added.'
      redirect_to car_path(@car)
    else
      render 'logs/new'
    end
  end

  private

  def log_params
    params.require(:log).permit(:car_id, :date, :mileage, :vendor, :price, :description)
  end

end
