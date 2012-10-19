class Venue
  include Mongoid::Document

  field :name, type: String

  validates :name, :presence => :true
  validates :venue, :presence => :true

  attr_accessible :name

  has_many :deals
end
