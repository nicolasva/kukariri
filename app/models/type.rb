class Type < ActiveRecord::Base
  attr_accessible :descriptif
  attr_accessible :item_id
  attr_accessible :contact_id
  validates_presence_of :item_id
  belongs_to :item
  belongs_to :contact
  has_many :notifications
  has_many :pictures
  accepts_nested_attributes_for :item
  accepts_nested_attributes_for :contact
end
