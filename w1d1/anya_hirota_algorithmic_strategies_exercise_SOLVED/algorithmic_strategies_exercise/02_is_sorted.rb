# Write a method, is_sorted(arr), that accepts an array of numbers as an arg.
# The method should return true if the elements are in increasing order, false otherwise.
# Do not use the built-in Array#sort in your solution :)

#take array that is arg sort with bubble sort 
#compare 

def is_sorted(arr)
    sorted_arr = arr.dup

    sorted = false
    while !sorted
        sorted = true
        (0...sorted_arr.length - 1).each do |i|
            if sorted_arr[i] > sorted_arr[i+1]
               sorted_arr[i], sorted_arr[i+1] = sorted_arr[i+1], sorted_arr[i]
                sorted = false
            end
        end
    end

    sorted_arr == arr
     
end


p is_sorted([1, 4, 10, 13, 15])       # => true
p is_sorted([1, 4, 10, 10, 13, 15])   # => true
p is_sorted([1, 2, 5, 3, 4 ])         # => false


