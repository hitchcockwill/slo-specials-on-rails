object @venue
attributes :name, :id, :name_url, :hours, :address, :phone, :website, :logo, :tags, :age_limit, :details

child :deals do
  extends "/api/v1/deals/show"
end
