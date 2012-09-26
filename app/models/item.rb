class Item < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  accepts_nested_attributes_for :pictures
  # attr_accessible :title, :body
end
