class UpdateTaskService 
  attr_accessor :task, :params

  def initialize(task, params) 
    @task = task
    @params = params
  end

  def call 
    update_task!
    
    update_task_status if params.key?(:status)
    
    true
  rescue ActiveRecord::RecordInvalid
    false
  end

  private

  def update_task_status
    UpdateTaskStatusService.new(task, params[:status]).call
  end

  def update_task!
    task.update!(params.except(:status))
  end
end