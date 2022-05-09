class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.update( title: params[:task][:title], body: params[:task][:body], priority_id: params[:task][:priority_id])
      redirect_to tasks_path
    else
      flash[:notice] = @task.errors.full_messages.to_sentence
      redirect_to edit_task_path
    end
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    flash[:notice] = @task.errors.full_messages.to_sentence unless @task.destroy
    redirect_to tasks_path
  end

  def assign
    @task = Task.find_by(id: params[:id])
    if @task.update(assignee_id: session[:user_id])
      redirect_to tasks_path
    else
      flash[:notice] = @task.errors.full_messages.to_sentence unless @task.destroy
      redirect_to tasks_path
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.reporter_id ||= session[:user_id]
    if @task.save
      redirect_to tasks_path
    else
      flash[:notice] = @task.errors.full_messages.to_sentence
      redirect_to new_task_path
    end
  end

  def users_tasks
    @tasks = Task.all.where(assignee_id: session[:user_id])
  end

  def new
    @task = Task.new
  end

  private
  def task_params
    params.require(:task).permit(:title, :body, :priority_id)
  end
end
