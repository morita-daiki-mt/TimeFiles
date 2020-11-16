class TasksController < ApplicationController
  require 'csv'

  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.all
    @task = Task.new
    @task.histories.build
    @history = History.new

    respond_to do |format|
      format.html
      format.csv do |csv|
        send_tasks_csv(@tasks)
      end
    end
  end

  def show
    @task = current_user.tasks.find(params[:id])
    @histories = @task.histories.order(action_at: :desc)
    @history = History.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.histories.each do |history|
      history.user_id = current_user.id
      history.task_id = @task.id
      history.save
    end
    if @task.save
      flash[:success] = 'タスクを追加しました'
      redirect_to tasks_path
    else
      flash[:danger] = 'タスク追加に失敗しました'
      redirect_to tasks_path
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = 'タスクを編集しました'
      redirect_back(fallback_location: tasks_path)
    else
      flash[:danger] = 'タスク編集に失敗しました'
      redirect_back(fallback_location: tasks_path)
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.user_id == current_user.id
      @task.destroy 
      flash[:success] = 'タスクを削除しました'
      redirect_to tasks_path
    else
      flash[:danger] = 'タスクを削除できませんでした'
      redirect_to tasks_path
    end
  end

  def send_tasks_csv(tasks)
    csv_data = CSV.generate do |csv|
      header = %w(content user_id task_id memo action_at)
      csv << header

      tasks.each do |task|
        task.histories.each do |history|
          values = [history.task.content, history.task.user_id, history.task_id, history.task.memo, history.action_at]
          csv << values
        end
      end
    end
    send_data(csv_data, filename: "timefiles_tasks.csv")
  end

  private

  def task_params
    params.require(:task).permit(:id, :content, :icon, :memo, histories_attributes:
                                [:id, :task_id, :action_at])
  end
end
