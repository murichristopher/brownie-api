class DashboardController < ApplicationController
  before_action :authenticate_user!

  def overview
    total_projects = Project.count
    total_users = User.count
    total_tasks = Task.count

    task_status_counts = Task.group(:status).count
    completion_rate = Task.where(status: 'done').count.to_f / total_tasks * 100 rescue 0

    render json: {
      total_projects: total_projects,
      total_users: total_users,
      total_tasks: total_tasks,
      task_status_counts: task_status_counts,
      completion_rate: completion_rate.round(2)
    }
  end

  def detailed_projects
    projects = Project.includes(:tasks).map do |project|
      {
        id: project.id,
        name: project.name,
        description: project.description,
        tasks: project.tasks.map do |task|
          {
            id: task.id,
            title: task.title,
            status: task.status,
            coins: task.coins,
            user_id: task.user_id
          }
        end
      }
    end

    render json: projects
  end

  def users_summary
    users = User.select(:id, :name, :email, :coins).map do |user|
      {
        id: user.id,
        name: user.name,
        email: user.email,
        coins: user.coins,
        tasks_count: Task.where(user_id: user.id).count
      }
    end

    render json: users
  end
end
