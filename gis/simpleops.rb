require 'rgeo'

class SpatialObject
  def initialize(x, y)
    @factory = RGeo::Cartesian.simple_factory(srid: 0)
    @point = @factory.point(x, y)
  end

  def distance_to(other_object)
    unless other_object.is_a?(SpatialObject)
      raise ArgumentError, 'Argument must be a SpatialObject'
    end

    @point.distance(other_object.point)
  end

  def area
    0.0
  end

  def within_distance?(other_object, max_distance)
    distance_to(other_object) <= max_distance
  end

  def bounding_box(radius)
    unless @point.respond_to?(:envelope)
      raise NotImplementedError, 'Bounding box not supported for this type of spatial object'
    end

    envelope = @point.envelope
    envelope.buffer(radius)
  end

  def point
    @point
  end
end

class SpatialObjectCollection
  def initialize
    @objects = []
  end

  def add_object(object)
    @objects << object if object.is_a?(SpatialObject)
  end

  def calculate_total_area
    @objects.map(&:area).reduce(:+)
  end

  def find_objects_within_distance(reference_object, max_distance)
    @objects.select { |obj| obj.within_distance?(reference_object, max_distance) }
  end 

  def objects 
    @objects
  end 
end

# Create a collection of spatial objects
collection = SpatialObjectCollection.new
collection.add_object(SpatialObject.new(0, 0))
collection.add_object(SpatialObject.new(3, 4))
collection.add_object(SpatialObject.new(-2, -1))

# Calculate the total area of the collection
total_area = collection.calculate_total_area
puts "Total area of the collection: #{total_area} square units"

# Find objects within a certain distance from a reference object
reference_object = SpatialObject.new(0, 0)
max_distance = 5
nearby_objects = collection.find_objects_within_distance(reference_object, max_distance)

puts "Objects within #{max_distance} units from the reference object:"
nearby_objects.each { |obj| puts "#{obj.point.x}, #{obj.point.y}" }

# Create a bounding box around a specific object
radius = 2
bounding_box = collection.objects.first.bounding_box(radius)
puts "Bounding box around the first object: #{bounding_box}"
