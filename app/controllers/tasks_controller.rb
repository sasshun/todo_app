class TasksController < ApplicationController

  def index
    @task = Task.new
    @tasks = Task.all

    # 今日のタスク時間が登録されているタスクのみが抽出。GPTに教えてもらっただけなので後で要確認
    @operating_tasks = Task.joins(:task_times).where("task_times.started_at >= ? AND task_times.started_at < ?", Date.today.beginning_of_day, Date.tomorrow.beginning_of_day).order('task_times.id ASC')
    @operating_task_times = TaskTime.where("started_at >= ? AND started_at < ?", Date.today.beginning_of_day, Date.tomorrow.beginning_of_day).order('id ASC')
  end

  def new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    end
  end

  def show

  end

  def edit
  end

  def update
  end

  def destroy
    @task = Task.find params[:id]
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:content, :status)
  end

end
