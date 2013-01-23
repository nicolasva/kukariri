class Item < ActiveRecord::Base
  attr_accessor :type, :picture 
  attr_accessible :title, :type, :pictures
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

  def save_new
    item = self.save
    if self.save      
      type = self.types.new(self.type)
      type.save
    end
    return self
  end
end
