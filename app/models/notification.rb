class Notification < ActiveRecord::Base
  attr_accessible :date_at, :type_id
  belongs_to :type
  validates_presence_of :date_at
  validates_presence_of :type_id
end
