class Type < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :item
  belongs_to :contact
  has_many :notifications
  accepts_nested_attributes_for :item
  accepts_nested_attributes_for :contact
end
