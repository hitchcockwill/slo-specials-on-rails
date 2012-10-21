object @deal
attributes :title, :kind, :unit, :dollars, :cents, :time, :hours, :days

child :venue do
  attributes :name, :id
end
