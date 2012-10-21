object @venue
attributes :name, :id, :tags, :deals_today

child :deals do
  attributes :title, :price, :id
end
