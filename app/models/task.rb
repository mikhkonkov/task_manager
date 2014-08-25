class Task < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  belongs_to :assigned_to, class_name: 'User'

end
