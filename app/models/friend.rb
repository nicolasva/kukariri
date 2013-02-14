class Friend < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :users
  validates_presence_of :follow
  validates_presence_of :friend
end
