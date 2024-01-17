class TasksController < ApplicationController
  def index
    @tasks  = Task.order('limit_date').all
    @status = ['todo', 'doing', 'done']  
  end

  def new
    @task =Task.new
  end

  def create
    Task.create(task_params)
    redirect_to root_path
  end

  private
  def task_params
    params.require(:task).permit(:state, :task, :limit_date)
  end
end
