class TasksController < ApplicationController
  def index
    @tasks  = Task.order('limit_date').all
    @status = ['todo', 'doing', 'done']
    @data = {"hoge": 50, "fuga": 30, "foo": 70, "bar": 10}
  end

  def new
    @task =Task.new
  end

  def create
    Task.create(task_params)
    redirect_to root_path
  end


  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to "/"
  end

  private
  def task_params
    params.require(:task).permit(:state, :task, :limit_date)
  end
end
