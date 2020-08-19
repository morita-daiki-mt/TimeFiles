class HistoriesController < ApplicationController
#   def index
#     @histories = current_task.histories.all
#   end

#   def show
#     @history = History.find(params[:id])
#   end

#   def new
#     @history = History.new
#   end

  def create
    task = Task.find_by(params[:id])
    @history = task.histories.build(history_params)
    task.histories.each do |history|
      history.user_id = current_user.id
      history.task_id = task.id
      history.save
    end
    #binding.pry
    redirect_to task_path(task.id)
  end

#   def edit
#     @history = History.find(params[:id])
#   end

#   def update
#     @history = History.find(params[:id])

#     if @history.update(history_params)
#       redirect_to tasks_path
#     else
#       render :show
#     end
#   end

#   def destroy
#     @history = History.find(params[:id])
#     @history.destroy
#     redirect_to tasks_path
#   end

#   private

  def history_params
    params.require(:history).permit(:id, :user_id, :task_id, :action_at)
  end
end
