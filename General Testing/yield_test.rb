nums1 = [3, 4, 9, 3, 5]
strs1 = %w[dog cat tail bottle feather goat]

# @param [Array] arr
def my_find(arr)
  arr.each { |el|
    if yield el
      return el
    end
  }
  nil
end

greater_than_5 = my_find(nums1) do |item|
  item > 5
end

ends_in_e = my_find(strs1) { |str|
  str[-1] == "e"
}
puts "Testing find"
print "Num greater than 5: "
puts greater_than_5
print "Word ending in e: "
puts ends_in_e

# @param [Array] arr
def my_keep_if(arr)
  # Prob not the most memory-efficient way
  keep = []
  arr.each do |el|
    keep << el if yield el
  end
  keep
end

all_greater_than_4 = my_keep_if(nums1) { |el|
  el > 4
}

puts all_greater_than_4

# @param [Array] arr
def my_each(arr)
  for el in arr
    yield el
  end
end

puts "Testing each"
my_each(nums1) do |num|
  puts num + 1
end

# @param [Array] arr
def my_map(arr)
  new_arr = Array.new arr
  my_each(arr) do |el|
    new_arr << (yield el)
  end
  new_arr
end

# @param [Array] arr
def my_map!(arr)
  arr.size.times do |count|
    arr[count] = yield arr[count]
  end
end

puts "Testing map:"
nums2 = [1,2,3,4,5]

puts "Adding 10 to numbers 1-5:"
puts my_map(nums2) { |num|
  num + 10
}

puts "Testing map!:"
nums3 = [10,20,30,40,50]
puts "Mutating array to multiply its elements by 5"
my_map!(nums3) { |num|
  num * 5
}
puts nums3