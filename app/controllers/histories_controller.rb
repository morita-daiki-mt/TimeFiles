class HistoriesController < ApplicationController
  before_action :authenticate_user!

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
    @history = current_user.histories.build(history_params)
    if @history.save
      flash[:success] = '実行日を追加しました'
      redirect_to task_path(id: @history.task_id)
    else
      flash[:danger] = '実行日追加に失敗しました'
      # render task_path(id: @history.task_id)
    end
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

  def destroy
    @history = History.find(params[:id])
    @history.destroy if @history.user_id == current_user.id
    flash[:success] = '記録を削除しました'
    redirect_to task_path(@history.task_id)
  end

  private

  def history_params
    params.require(:history).permit(:id, :user_id, :task_id, :action_at)
  end
end
