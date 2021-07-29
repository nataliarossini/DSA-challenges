# GIVEN 2 arrays, create a function that let's a user know (true/false) whether these two arrays contain any common items
# For example:
# array1 = ['a', 'b', 'c', 'x']
# array2 = ['z', 'y', 'i']
# output = false
# -----------------------------
# array1 = ['a', 'b', 'c', 'x']
# array2 = ['z', 'y', 'x']
# output = true

array1 = ['a', 'b', 'c', 'x', 'z']
array2 = ['z', 'y', 'j']

def find_common_item(a1, a2)
    seen = {}
    a1.each { |e| seen[e] = 0 } # O(a)
    a2.each { |e| return true if seen[e] } # O(b)
    false
end
# O(a + b) Time Complexity
# O(a) Space Complexity

def find_common_item2(a1, a2)
    a1.each { |e| return true if a2.include?(e) }
    false
end

p find_common_item(array1, array2)
p find_common_item2(array1, array2)