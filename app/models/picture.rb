class Picture < ActiveRecord::Base
  #has_attached_file :picture, :styles => { :thumb => ["100x100#"], :original => ["500x500#"] },
  #:url => "/images/items/:item_id/pictures/:id/:basename.:extension",
  #:path => ":rails_root/app/assets/images/items/:item_id/pictures/:id/:basename.:extension"
  belongs_to :item
  belongs_to :type
  accepts_nested_attributes_for :item
  attr_accessible :picture
  attr_accessible :picture_file_name
  attr_accessible :picture_content_type
  attr_accessible :picture_file_size
  attr_accessible :picture_updated_at
  attr_accessible :item_id
  attr_accessible :type_id
end
