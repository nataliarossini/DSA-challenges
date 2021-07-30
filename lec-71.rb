# Merge sorted arrays 
# arr1 = [0, 3, 4, 31]
# arr2 = [4, 6, 30]
# output = [0, 3, 4, 4, 6, 30, 31]

arr1 = [0, 3, 4, 31]
arr2 = [4, 6, 30]

def merge_sorted_arrays(arr1, arr2)
    arr = arr1 + arr2
    arr.sort
end

p merge_sorted_arrays(arr1, arr2)

# not very clean solution but built from scratch

def merge_sorted_arrays2(arr1, arr2)
    arr1_item = arr1[0]
    arr2_item = arr2[0]
    merged = []
    i = 1
    j = 1

    while arr1_item || arr2_item
        if !arr2_item || arr1_item < arr2_item
            merged << arr1_item
            arr1_item = arr1[i]
            i +=1
        else
            merged << arr2_item
            arr2_item = arr2[j]
            j +=1
        end
    end
    merged
end

p merge_sorted_arrays2(arr1, arr2)
