class Item < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, :dependent => :destroy
  has_many :types, :dependent => :destroy
  accepts_nested_attributes_for :pictures
  accepts_nested_attributes_for :types
  attr_accessible :title, :types_attributes, :user_id, :id
end
