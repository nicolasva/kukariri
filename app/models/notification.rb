class Notification < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :type
end
