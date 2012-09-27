class Contact < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :types
  accepts_nested_attributes_for :types
  validates_presence_of :lastname
  validates_presence_of :firstname
  validates_presence_of :country
end
