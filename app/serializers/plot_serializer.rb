class PlotSerializer
  include JSONAPI::Serializer
  attributes :size, :direction, :garden_id, :plant_list
end
