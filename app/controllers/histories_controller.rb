class HistoriesController < ApplicationController
  before_action :authenticate_user!

  def create
    @history = current_user.histories.build(history_params)
    if @history.save
      flash[:success] = '実行日を追加しました'
      redirect_back(fallback_location: tasks_path)
    else
      flash[:danger] = '実行日追加に失敗しました'
      @history = current_user.histories.build(history_params)
      redirect_back(fallback_location: tasks_path)
    end
  end

  def destroy
    @history = History.find(params[:id])
    if @history.user_id == current_user.id
      @history.destroy
      flash[:success] = '記録を削除しました'
      redirect_to task_path(@history.task_id)
    else
      flash[:danger] = '記録を削除できませんでした'
      redirect_to task_path(@history.task_id)
    end
  end

  def calendar
    @tasks = current_user.tasks.all
    @histories = current_user.histories.includes(:task)
  end

  private

  def history_params
    params.require(:history).permit(:id, :task_id, :action_at)
  end
end
