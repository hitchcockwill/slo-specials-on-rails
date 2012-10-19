object @venue
attributes :name, :id

child :deals do
  attributes :title, :price, :id
end
