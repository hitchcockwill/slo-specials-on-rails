class Deal
  include Mongoid::Document

  field :title
  field :kind
  field :price, type: Float

  validates :title, :presence => :true
  validates :kind, :presence => :true
  validates :price, :presence => :true

  attr_accessible :title, :kind, :price, :venue_id

  belongs_to :venue
end
