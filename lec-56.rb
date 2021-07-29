require 'set'

arr = [ 1, 2, 3, 9] 
arr2 = [1, 2, 3, 4, 4]

sum = 8
# arr should return false because no pair sum == 8
# arr2 should teturn true because 4+4 = 8

# Naive Solution O(n^2)
def has_pair_with_sum(arr, sum)
    i = 0
    while i < arr.length 
        j = i+1
        while j < arr.length
            return true if (arr[i]+arr[j] == sum)
            j +=1
        end
        i +=1
    end
    false
end

# Better Solution

def has_pair_with_sum2(arr, sum)
    set = Set.new
    arr.each do |e|
        return true if set.include?(e)
        set.add(sum - e)
    end
    false
end

p has_pair_with_sum(arr, sum)
p has_pair_with_sum(arr2, sum)

p has_pair_with_sum2(arr, sum)
p has_pair_with_sum2(arr2, sum)