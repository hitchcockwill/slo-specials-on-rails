class Venue
  include Mongoid::Document
  
  field :name, type: String

  validates :name, :presence => :true

  attributes_accessible :name

  has_many :deals
end
