class Picture < ActiveRecord::Base
  attr_accessible :picture, :cached_path, :item_id, :type_id
  mount_uploader :picture, PicturesUploader
  before_save :build_picture_from_cache, :if => "remote_picture_url.blank?" 
  belongs_to :item
  belongs_to :type
  accepts_nested_attributes_for :item

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
