class Contact < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :lastname
  attr_accessible :firstname
  attr_accessible :email
  attr_accessible :tel_home
  attr_accessible :tel_mobil
  attr_accessible :adress
  attr_accessible :country
  attr_accessible :user_id
  attr_accessible :types_attributes
  attr_accessible :region
  has_many :types
  has_one :provided_date
  belongs_to :user
  accepts_nested_attributes_for :types
  validates_presence_of :lastname
  validates_presence_of :firstname
  validates_presence_of :country
end
