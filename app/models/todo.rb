# A todo maps to a real life task a user has to complete.
# As such it holds information about what that task is.
class Todo < ActiveRecord::Base
  validates :name, presence: true
end
