class Deal
  include Mongoid::Document

  field :title
  field :kind
  field :unit
  field :price, type: Float
  field :time, type: Hash

  validates :title, :presence => :true
  validates :kind, :presence => :true
  validates :price, :presence => :true

  attr_accessible :title, :kind, :price, :venue_id, :unit, :time, :details

  belongs_to :venue
end
