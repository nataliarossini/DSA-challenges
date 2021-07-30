# Create a function that reverses a string:
# 'Hi My name is Andrei' should be:
# "ierdnA si eman yM iH"
str = 'Hi My name is Andrei'

def reverse_string(str)
    arr = str.split('')
    leng = arr.length
    i = 0
    new_arr = []
    while i < arr.length # O(n)
        new_arr << arr[leng-=1]
        i +=1
    end
    new_arr.join
end

p reverse_string(str)
p str.reverse