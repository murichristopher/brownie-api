class UpdateTaskStatusService 
  class UpdateTaskStatusError < StandardError
    def initialize(message)
      super(message)
    end
  end

  attr_accessor :task, :status

  def initialize(task, status) 
    @task = task
    @status = status
  end

  def call
    begin
      ActiveRecord::Base.transaction do
        credit_or_debit_user_balance
        update_task_status
      end
    end
  end

  private

  def credit_or_debit_user_balance
    from_status = task.status.to_sym
    to_status = status.to_sym

    return if [from_status, to_status].exclude?(:done) || from_status == to_status

    return credit_user_balance if to_status.eql?(:done)

    debit_user_balance 
  end

  def credit_user_balance
    user = task.user

    raise UpdateTaskStatusError, "Cannot update task status without a user assigned" unless user

    user.update({coins: user.coins += task.coins})
  end

  def debit_user_balance
    user = task.user

    raise UpdateTaskStatusError, "Cannot update task status without a user assigned" unless user

    user.update({coins: user.coins -= task.coins})
  end

  def update_task_status
    task.update({status: status})
  end
end