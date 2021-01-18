# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  hash = Hash.new 0
  lengths = [a,b,c].sort
  if lengths[0] <= 0 || lengths[2] >= (lengths[0] + lengths[1])
    raise TriangleError
  end
  [a, b, c].each do |el|
    hash[el] += 1
  end
  max = hash.values.max
  (max == 3 ? :equilateral : max == 2 ? :isosceles : :scalene)
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
