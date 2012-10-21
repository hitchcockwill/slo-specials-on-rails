class Deal
  include Mongoid::Document

  field :title
  field :kind
  field :unit
  field :dollars
  field :cents
  # field :price, type: Float
  field :time, type: Hash
  field :hours
  field :days

  validates :title, :presence => :true
  validates :kind, :presence => :true

  attr_accessible :title, :kind, :dollars, :cents, :venue_id, :unit, :time, :details, :hours, :days

  belongs_to :venue
end
