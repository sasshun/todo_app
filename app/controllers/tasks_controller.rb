class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    end
  end

  def edit
  end

  def show
    @task = Task.find params[:id]
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:content)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end