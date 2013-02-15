class Friend < ActiveRecord::Base
  attr_accessible :follow, :friend, :user_ids, :user_id, :accept_friend
  belongs_to :user
  has_and_belongs_to_many :users
end
