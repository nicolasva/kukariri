class Item < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  has_many :types
  accepts_nested_attributes_for :pictures
  accepts_nested_attributes_for :types
  attr_accessible :title
end
