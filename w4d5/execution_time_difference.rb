def phase_1(array)
    sorted = false 
    while !sorted 
        sorted = true
        (0...array.length - 1).each do |i|
            if array[i] > array[i+1]
                array[i], array[i+1] = array[i+1], array[i]
                sorted = false
            end
        end 
    end 
    array.first
end 


# O(n^2)



def phase_2(array)
    min = array.shift
    array.each do |ele|
        min = ele if ele < min
    end
    return min
end

# O(n)

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# p phase_2(list)

def sub_sum_1(array)
    subsets = []
    (0...array.length).each do |i|
        (i...array.length).each do |j|
            subsets << array[i..j]
        end 
    end
    p subsets
    max = subsets.shift
    subsets.each do |subset|
        max = subset if subset.sum > max.sum
    end
    max.sum
end 

# O(n^k)

list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]

p sub_sum_1(list3)

def sub_sum_2(array)
    largest_sum = array.shift 
    current_sum = largest_sum 
    array.each do |ele|
        current_sum += ele
        current_sum = ele if current_sum < ele
        largest_sum = current_sum if current_sum > largest_sum
        largest_sum = ele if ele > largest_sum
    end
    return largest_sum
end



p sub_sum_2(list3)



