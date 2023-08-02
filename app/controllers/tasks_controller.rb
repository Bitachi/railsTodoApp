class TasksController < ApplicationController

  def index
    @tasks = Task.all()
    @new_task = Task.new
  end

  def create
    @new_task = Task.new(task_params)
    if @new_task.save
      flash[:success] = "登録完了しました！"
      redirect_to root_url
    else
      @tasks = Task.all()
      flash[:danger] = "登録失敗しました。"
      render "index", status: :unprocessable_entity
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "更新しました！"
      redirect_to "/tasks/#{@task.id}/edit"
    else
      flash[:danger] = "更新失敗しました。"
      render "edit", status: :unprocessable_entity
    end
  end

  private
    def task_params
      params.require(:task).permit(:title, :status, :deadline)
    end
end
