class Type < ActiveRecord::Base
  attr_accessible :date_at, :date_to, :descriptif, :item_id, :contact_id
  belongs_to :item
  belongs_to :contact
  has_many :notifications
  has_many :pictures
  accepts_nested_attributes_for :item
  accepts_nested_attributes_for :contact
end
