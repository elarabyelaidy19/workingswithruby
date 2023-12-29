require 'rgeo' 

factory = RGeo::Cartesian.factory 
simple_factory = RGeo::Cartesian.simple_factory 
spherical = RGeo::Geographic.spherical_factory

point = factory.point(0, 0)  
point2 = factory.parse_wkt('POINT(2 0)')
point3 = factory.point(2, 2) 

p point   
p point2 
to hash  
point_hash = [:x, :y, :z].map { |axis| [axis, point.send(axis)]}
coords = ['x', 'y', 'z'].map { |axis| point.send(axis) }
lstring = simple_factory.line_string([point, point2, point3]) 

line_string = factory.parse_wkt('LINESTRING(0 0, 2 0, 2 2)')
p lstring.boundary
p line_string.length 
p lstring == line_string
p lstring

factory = RGeo::Geos.factory

line_string1 = factory.line_string([point1, point2, point3])
line_string2 = factory.line_string([point4, point5]) 
four_points = factory.multi_point([point1, point2, point3, point4])
colle = factory.collection([line_string1, line_string2])
geometry2 = RGeo::Feature.cast(line_string2, factory: factory)
geometry1 = RGeo::Feature.cast(line_string1, factory: factory)
four_points.each do |point|
    p point
end

p line_string1.intersects?(line_string2) 
p line_string1
p four_points
p colle

p large_triangle = factory.polygon(line_string1)
point6 = factory.point(0, 2)
point7 = factory.point(-1, 1)
line_string3 = factory.line_string([point5, point6, point7])
triangle_with_hole = factory.polygon(line_string1, [line_string3])

p geometry1.intersects?(geometry2)
# p line_string1
# p line_string1.num_points
# p line_string1.points
# p line_string1.end_point == point3 

factory = RGeo::Geos.factory
point1 = factory.point(1, 0)
point2 = factory.point(1, 4)
point3 = factory.point(-2, 4)
point4 = factory.point(-2, 0)

# Construct a linear ring (closed loop of points)
linear_ring = factory.linear_ring([point1, point2, point3, point4, point1])

# Construct a polygon from the linear ring
polygon = factory.polygon(linear_ring) 
p polygon.valid? 
p polygon.area

point = factory.point(1.0, 2.0)
point2 = factory.point(1.0, 2.0)
line = factory.linear_ring([])
polygon = factory.polygon(line)

p point
p line
p polygon 


point1 = factory.point(1, 0)
point2 = factory.point(1, 4)
point3 = factory.point(-2, 4)
point4 = factory.point(-2, 0)

linear_ring = factory.line_string([point1, point2, point3, point4, point1])

polygon = factory.polygon(linear_ring)
pt1 = factory.point(0, 0)
pt2 = factory.point(2, 0)
pt3 = factory.point(2, 2) 
pt4 = factory.point(0, 2)  
env = pt4.envelope 
area =env.buffer(2) 
p area.area
points = coords.map { |c| factory.point(c[0], c[1]) }
line = factory.line_string([pt1, pt2, pt3, pt4, pt1])  
linear_ring = factory.linear_ring(line.points)
p line 
p line.length
p line.boundary
p line.closed? 
p line.simple? 
p line == linear_ring
polygon = factory.polygon(line)
p polygon.valid? 
p polygon.area

