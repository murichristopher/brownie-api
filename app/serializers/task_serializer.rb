class TaskSerializer < ActiveModel::Serializer
  belongs_to :user

  attributes :id, :title, :coins, :status, :created_at, :priority, :due_date, :project
end
