# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.


def largest_prime_factor(num)
    
    i = num 

    while i >= 2
        if prime?(i) && num % i == 0
            return i
        end
        i -= 1 
    end 
end 

def prime?(num)
    if num < 2 
        return false 
    end 

    (2...num).each do |i|
        if num % i == 0
            return false
        end 
    end 

    true
end 

def unique_chars?(str)
    count = Hash.new(0)
    str.each_char { |char| count[char] += 1 }
    count.each_value do |v|
        if v > 1
            return false
        end
    end
    
    true
end

def dupe_indices(arr)
    indices = Hash.new { |h, k| h[k] = [] }

    arr.each_with_index do |ele, i|
            indices[ele] << i 
        end

    indices.select { |k, v| v.length > 1 }
end


def ana_array(arr1, arr2)
    count1 = Hash.new(0)
    count2 = Hash.new(0)

    arr1.each {|ele| count1[ele] += 1}
    arr2.each {|ele| count2[ele] += 1}

    count1 == count2
end 
