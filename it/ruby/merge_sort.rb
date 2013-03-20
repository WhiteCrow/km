def merge(left, right)
  final = []
  until left.empty? or right.empty?
    final << (left.first < right.first ? left.shift : right.shift)
  end
  final + left + right
end

def merge_sort(array)
  return array if array.size < 2
  left = array.first(array.size/2)
  right = array.last(array.size - array.size/2)
  merge(merge_sort(left), merge_sort(right))
end

##test##

arr = []
1000.times{|t| arr << rand(1000)}

puts merge_sort(arr)

