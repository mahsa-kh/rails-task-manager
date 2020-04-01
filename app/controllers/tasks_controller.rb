class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id].to_i)
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.create(tasks_params)

    redirect_to task_path(task.id)
  end

  def edit
    @task = Task.find(params[:id].to_i)
  end

  def update
    task = Task.find(params[:id].to_i)
    task.update(tasks_params)

    redirect_to task_path(task.id)
  end

  def destroy
    task = Task.find(params[:id].to_i)
    task.delete

    redirect_to root_path
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :details, :completed, :checkbox_value)
  end
end
