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

#   def create
#     @history = current_user.histories.build(task_id: params[:task_id], history_params[:action_at] )
#     @history.save
#     redirect_to tasks_path
#   end

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

#   def history_params
#     params.require(:history).permit(:action_at)
#   end
end
