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
def pytagoras a, b, c
	s, m, b = [a, b, c].sort
	#puts '*'*70
    #puts b, m, s
	#return (b >= Math.sqrt((m**2 + s**2)))
    return (b >= (m + s)) 
end	

def triangle(a, b, c)
  
  raise TriangleError if a <= 0 or b <= 0 or c <= 0

  raise TriangleError if pytagoras(a, b, c)

  return :equilateral if (a == b and b == c)

  return :isosceles  if (a == b) or (a == c) or ( b == c)

  return :scalene
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
