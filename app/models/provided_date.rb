class ProvidedDate < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :item_id
  attr_accessible :contact_id
  attr_accessible :date_at
  attr_accessible :date_to
  attr_accessible :date_to_activation
  belongs_to :contact
  belongs_to :item
end
