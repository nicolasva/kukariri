class Picture < ActiveRecord::Base
  attr_accessible :picture, :cached_path, :is_master
  mount_uploader :picture, PicturesUploader
  before_save :build_picture_from_cache, :if => "remote_picture_url.blank?" 
  validates_presence_of :master
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

  def build_picture_from_cache
    unless self.cached_path.nil? or self.cached_path.eql?('default_picture')
      uploader = PicturesUploader.new
      uploader.retrieve_from_cache!(self.cached_path)
      picture = File.open("#{Rails.root}/public#{uploader.to_s}")
      self.picture = CarrierWave::SanitizedFile.new(picture)
    end
  end

  def picture=(val)
    if !val.is_a?(String) && valid?
      picture_will_change!
      super
    end
  end
end
