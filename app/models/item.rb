class Item < ActiveRecord::Base
  attr_accessor :type, :picture
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

  def save_new(type_params,tab_pictures)
    item = self.save
    if self.save      
      type = self.types.new(type_params)
      if type.save
        tab_pictures["ids"].each do |value|
          picture = Picture.find(value)
          picture.update_attributes(:item_id => self.id, :type_id => type.id)
        end
      end
    end
    return self
  end
end
