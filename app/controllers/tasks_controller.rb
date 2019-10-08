class TasksController < ApplicationController
  def index
    if params[:task][:search].present?
      @tasks = Task.where("task_name LIKE ?", "%#{ params[:task][:task_name] }%")
    elsif params[:end_time].present?
      @tasks = Task.all.order(end_time: "DESC")
    else
      @tasks = Task.all.order(created_at: "DESC")
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: t('flash.create')
    else
    render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: t('flash.update')
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: t('flash.delete')
  end
  
  private
  def task_params
    params.require(:task).permit(:task_name, :memo, :end_time, :status, :serach)
  end
end
