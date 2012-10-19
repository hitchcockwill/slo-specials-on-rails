class Venue
  include Mongoid::Document

  field :name, type: String

  validates :name, :presence => :true

  attr_accessible :name, :deal_ids

  has_many :deals

  accepts_nested_attributes_for :deals
end
