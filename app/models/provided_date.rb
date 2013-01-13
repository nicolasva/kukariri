class ProvidedDate < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :item_id
  attr_accessible :contact_id
  attr_accessible :date_at
  attr_accessible :date_to
  attr_accessible :date_to_activation
  validates_presence_of :date_at
  validates_presence_of :date_to_activation
  validates_presence_of :contact_id
  validates_presence_of :item_id
  belongs_to :contact
  belongs_to :item
end
