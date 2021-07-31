# Google Question
# Given an array = [2,5,1,2,3,5,1,2,4]:
# it should return 2

# Given an array = [2,1,1,2,3,5,1,2,4]:
# ir should return 1

# Given an array = [2,3,4,5]
# it should return undefined
require 'set'

def first_recurring_char(array)
    hash = Set.new
    array.each do |e|
        if hash.include?(e)
            return e
        else
            hash.add(e)
        end
    end
    nil
end
array = [2,5,1,2,3,5,1,2,4] # 2
array1 = [2,1,1,2,3,5,1,2,4] # 1
array2 = [2,3,4,5] # undefined / nil in ruby
p first_recurring_char(array)
p first_recurring_char(array1)
p first_recurring_char(array2)