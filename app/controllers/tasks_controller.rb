class TasksController < ApplicationController
  def index
    
    if params[:task].present?
      if params[:task][:task_name].present? && params[:task][:status].present?
        @tasks = Task.search_task_name(params[:task][:task_name]).search_status(params[:task][:status]).page(params[:page]).per(8)
      elsif params[:task][:task_name].present?
        @tasks = Task.search_task_name(params[:task][:task_name]).page(params[:page]).per(8)
      elsif params[:task][:status].present?
        @tasks = Task.search_status(params[:task][:status]).page(params[:page]).per(8)
      end
    elsif params[:end_time].present?
      @tasks = Task.end_time.page(params[:page]).per(8)
    elsif params[:priority].present?
      @tasks = Task.priority.page(params[:page]).per(8)
    else
      @tasks = Task.created_at.page(params[:page]).per(8)
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
    params.require(:task).permit(:task_name, :memo, :end_time, :status, :search, :priority)
  end
end
