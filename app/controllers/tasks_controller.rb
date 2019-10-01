class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new
    if @task.save
      redirect_to
    else
      redirect_to
    end
  end

  def show
  end

  def edit
  end
end
