class LogsController < ApplicationController

  def create
    @car = Car.find params[:car_id]
    #@log = Log.new(params.require(:log).permit(:log))
    #@log.car = @car
    @log = @car.logs.build(params.require(:log).permit(:log)) #this line replace the above two
    @log.user = current_user#User.first #need to fix this after authentication

    if @log.save
      flash[:notice] = 'Your log was added.'
      redirect_to user_path(@car)
    else
      render 'posts/show'
    end
  end

  def show

  end
end
