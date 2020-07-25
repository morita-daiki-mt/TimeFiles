class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'タスクを追加しました'
      redirect_to tasks_path
    else
      flash[:danger] = 'タスク追加に失敗しました'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'タスクを編集しました'
      redirect_to tasks_path
    else
      flash.now[:danger] = 'タスク編集に失敗しました'
      render :show
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  
    flash[:success] = 'タスクを削除しました'
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:content, :icon, :memo)
  end
end
