class Venue
  include Mongoid::Document

  field :name
  field :name_url
  field :hours
  field :address
  field :phone
  field :website
  field :logo, type: Hash
  field :tags, type: Array
  field :age_limit
  field :details


  validates :name, :presence => :true

  attr_accessible :name, :deal_ids, :name_url, :hours, :address, :phone, :website, :logo, :tags, :age_limit, :details

  has_many :deals

  accepts_nested_attributes_for :deals
end
