class TaskTimesController < ApplicationController
  def create
    @task_time = TaskTime.new
    @task_time.task_id = params[:task_id]
    @task_time.started_at = Time.zone.now
    last_task = TaskTime.last

    # 一つ前のTaskオブジェクトが本メソッド実行タイミングと同じ日に登録されたものであった場合、ended_atを本メソッドが実行された時間に更新する。
    if last_task.present? && last_task.task.created_at.to_date == Date.today
      last_task.update(ended_at: Time.zone.now)
      flash[:noticetime] = "時間も登録"
    end

    # Taskオブジェクトを保存
    if @task_time.save
      flash[:notice] = "タスクを開始"
      redirect_to tasks_path
    else
      flash[:notice] = "タスク開始処理失敗"
      redirect_to tasks_path
    end

  end

end
