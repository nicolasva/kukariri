class Picture < ActiveRecord::Base
  belongs_to :item
  belongs_to :type
  accepts_nested_attributes_for :item
  # attr_accessible :title, :body
end
