json.array! @locations do |location|
  json.(location, :id, :name, :weekdays, :weekends, :description)
  json.open location.open?
end
