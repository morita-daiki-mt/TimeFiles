class HistoriesController < ApplicationController
  def index
    @histories = History.all
  end

  def show
    @history = History.find(params[:id])
  end

  def new
    @history = History.new
  end

  def create
    @history = History.new(history_params)

    if @history.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    @history = History.find(params[:id])
  end

  def update
    @history = History.find(params[:id])

    if @history.update(history_params)
      redirect_to tasks_path
    else
      render :show
    end
  end

  def destroy
    @history = History.find(params[:id])
    @history.destroy
  
    redirect_to tasks_path
  end

  private

  def history_params
    params.require(:history).permit(:action_at)
  end
  
end
