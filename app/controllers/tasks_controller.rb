class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.all
    @task = Task.new
    @task.histories.build
  end

  def show
    @task = current_user.tasks.find(params[:id])
    @histories = @task.histories.order(action_at: :desc)
    @history = History.new
  end

  # def new
  #   @task = Task.new
  #   @task.histories.build
  # end

  def create
      @task = current_user.tasks.build(task_params)
      @task.save
      if @task.histories.each do |history|
          history.user_id = current_user.id
          history.task_id = @task.id
          history.save
        end
        flash[:success] = 'タスクを追加しました'
        redirect_to tasks_path
      else
        flash[:danger] = 'タスク追加に失敗しました'
        render :new
      end
      # binding.pry
  end

  # def edit
  #   @task = Task.find(params[:id])
  # end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'タスクを編集しました'
      redirect_to task_path(id: @task.id)
    else
      flash.now[:danger] = 'タスク編集に失敗しました'
      render :show
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy if @task.user_id == current_user.id
    flash[:success] = 'タスクを削除しました'
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:id, :content, :icon, :memo, histories_attributes: [:id, :user_id, :task_id, :action_at])
  end
end
