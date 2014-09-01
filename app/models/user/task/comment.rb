class User::Task::Comment < ActiveRecord::Base
  belongs_to :task, :class_name => 'Task'
  belongs_to :user
end
