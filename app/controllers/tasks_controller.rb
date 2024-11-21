class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:index, :create]
  before_action :task, only: [:show, :update, :destroy]

  def index
    tasks = @project ? @project.tasks : Task.all
    render json: tasks
  end

  def my_tasks
    tasks = Task.where(user: current_user)
    render json: tasks
  end

  def create
    task = @project ? @project.tasks.new(task_params) : Task.new(task_params)
    puts "task:", task_params

    if task.save
      render json: task
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: task
  end

  def update
    service = UpdateTaskService.new(task, task_params)

    if service.call
      render json: service.task
    else
      render json: { errors: service.task.errors.full_messages }, status: :unprocessable_entity
    end
  rescue UpdateTaskStatusService::UpdateTaskStatusError => e
    render json: { errors: e.message }, status: :unprocessable_entity
  end

  def destroy
    if task.delete
      render head: :no_content
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id]) if params[:project_id]
  end

  def task
    @task ||= Task.find(params[:id])
  end

  def task_params
    params.permit(Task.creatable_fields)
  end
end
