class Item < ActiveRecord::Base
  attr_accessible :title
  attr_accessible :types_attributes
  attr_accessible :user_id
  attr_accessible :id
  belongs_to :user
  has_many :pictures, :dependent => :destroy
  has_many :types, :dependent => :destroy
  has_many :provided_dates
  accepts_nested_attributes_for :pictures
  accepts_nested_attributes_for :types
  validates_presence_of :title
end
