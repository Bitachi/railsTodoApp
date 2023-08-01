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

  private
    def task_params
      params.require(:task).permit(:title, :status, :deadline)
    end
end
