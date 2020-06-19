
require "byebug"

# strange_sums
# Write a method strange_sums that accepts an array of numbers as an argument. The method should return a count of the number of distinct pairs of elements that have a sum of zero. You may assume that the input array contains unique elements.

# Examples

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

# count variable 
# nested loop - look at each num against another 
# add count 

def strange_sums(arr)
    count = 0

    arr.each_with_index do |num1, idx1|
        arr.each_with_index do |num2, idx2|
            count += 1 if (num1 + num2 == 0 && idx2 > idx1)
        end 
    end  
    count 
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0


# pair_product
# Write a method pair_product that accepts an array of numbers and a product as arguments. The method should return a boolean indicating whether or not a pair of distinct elements in the array result in the product when multiplied together. You may assume that the input array contains unique elements.

# Examples

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def pair_product(arr, product)
    
    arr.each_with_index do |num1, idx1|
        arr.each_with_index do |num2, idx2|
            return true if (num1 * num2 == product && idx2 > idx1)
        end 
    end  

    false 
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

# rampant_repeats
# Write a method rampant_repeats that accepts a string and a hash as arguments. The method should return a new string where characters of the original string are repeated the number of times specified by the hash. If a character does not exist as a key of the hash, then it should remain unchanged.


# turn string into the array 
# if hash has key element then multiply element by value
# if not we just return the element
# join back together and return

def rampant_repeats(str, hash)
    chars = str.split("")

    chars.map! do |char|
        if hash.has_key?(char)
            char * hash[char]
        else
            char
        end
    end

    chars.join("")
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'



# perfect_square?
# Write a method perfect_square? that accepts a number as an argument. The method should return a boolean indicating whether or not the argument is a perfect square. A perfect square is a number that is the product of some number multiplied by itself. For example, since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are perfect squares; 35 is not a perfect square.

# Examples

#range from 1..num
#if int & int == num then true else we return false after loop
def perfect_square(num)
    (1..num).each do |int|
        if int*int == num
            return true
        end
    end
    false
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

# anti_prime?
# Write a method anti_prime? that accepts a number as an argument. The method should return true if the given number has more divisors than all positive numbers less than the given number. For example, 24 is an anti-prime because it has more divisors than any positive number less than 24. Math Fact: Numbers that meet this criteria are also known as highly composite numbers.

# Examples
# we need to count the number of divisors that first number has,
# we can go through each number to determine if it has more divisors

def anti_prime?(num)
    (1...num).each {|int| return false if divisors(num) < divisors(int)}
        
    true
end

def divisors(num)
   count = 0
    (1...num).each do |int|
        if num % int == 0 
            count += 1
        end
    end
    count
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

# matrix_addition
# Let a 2-dimensional array be known as a "matrix". Write a method matrix_addition that accepts two matrices as arguments. The two matrices are guaranteed to have the same "height" and "width". The method should return a new matrix representing the sum of the two arguments. To add matrices, we simply add the values at the same positions:

# # programmatically
# [[2, 5], [4, 7]] + [[9, 1], [3, 0]] => [[11, 6], [7, 7]]

# # structurally
# 2 5  +  9 1  =>  11 6
# 4 7     3 0      7 7

# adding [0][0] + [1][0] 
# [0][1] + [1][1]

# only adding two 
#look at length of arr
# while loop

def matrix_addition(matrix1, matrix2)
    result = Array.new(matrix1.length) {Array.new(matrix1[0].length, 0)}
    i = 0
    
    while i < result.length 
        result[i].each_with_index do |ele, idx|
            result[i][idx] = matrix1[i][idx] + matrix2[i][idx]
        end 
        
        i += 1
    end 

    result
end


matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

# mutual_factors
# Write a method mutual_factors that accepts any amount of numbers as arguments. The method should return an array containing all of the common divisors shared among the arguments. For example, the common divisors of 50 and 30 are 1, 2, 5, 10. You can assume that all of the arguments are positive integers.

# Examples

# call all? method on array
# can integer divide all numbers?
    #from 1 to biggest with max

def mutual_factors(*num)
divisors = []
    (1..num.max).each do |int|
        if num.all? {|ele| ele % int == 0} 
            divisors << int
        end
    end
    divisors
end


# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

# tribonacci_number
# The tribonacci sequence is similar to that of Fibonacci. The first three numbers of the tribonacci sequence are 1, 1, and 2. To generate the next number of the sequence, we take the sum of the previous three numbers. The first six numbers of tribonacci sequence are:

# 1, 1, 2, 4, 7, 13, ... and so on
# Write a method tribonacci_number that accepts a number argument, n, and returns the n-th number of the tribonacci sequence.

# Examples

# use a while loop 
# while loop stops when index is n-1
# conditions for idx 0,1,2
#keep adding last three elements until we reach length of n
#return last element of array

def tribonacci_number(num)
    trib = [1, 1, 2]
    
    return nil if num < 1
    return 1 if num == 1 || num == 2
    return 2 if num == 3

    i = 3
    while i < num 
        new_num = trib[-1] + trib[-2] + trib[-3]
        trib << new_num
        
        i += 1
    end 

    trib[-1] 
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

# matrix_addition_reloaded
# Write a method matrix_addition_reloaded that accepts any number of matrices as arguments. The method should return a new matrix representing the sum of the arguments. Matrix addition can only be performed on matrices of similar dimensions, so if all of the given matrices do not have the same "height" and "width", then return nil.

# Examples
#similar elements to matrix addition
#while loop with two dimensional array
#if matrices aren't same length return nil

def matrix_addition_reloaded(*matrices)
   return nil if !matrices.all? {|matrix| matrix.length == matrices[0].length }
# p matrices
    result = Array.new(matrices[0].length) {Array.new(matrices[0][0].length, 0)}
    i = 0
#debugger

### matrices.inject { |acc, mat| matrix_addition(acc, mat) }
    while i < matrices.length
        i2 = 0
        while i2 < matrices[0].length
            # debugger
            matrices[i][i2].each_with_index do |number, idx|
                #debugger
            result[i2][idx] += number
            end
            i2 +=1
            
        end
        i += 1
    end
result
end

### deep dupe res = first.clone.map(&:clone)
### deep dupe res = first.dupe.map(&:dupe)


# def matrix_addition(matrix1, matrix2)
#     result = Array.new(matrix1.length) {Array.new(matrix1[0].length, 0)}
#     i = 0
    
#     while i < result.length 
#         result[i].each_with_index do |ele, idx|
#             result[i][idx] = matrix1[i][idx] + matrix2[i][idx]
#         end 
        
#         i += 1
#     end 

#     result
# end


# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil


# squarocol?
# Write a method squarocol? that accepts a 2-dimensional array as an argument. The method should return a boolean indicating whether or not any row or column is completely filled with the same element. You may assume that the 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.

# Examples

#check how long the array is - look at length of array[0]
#rows array.each look inside the row - nested enumerable (each & all)
#rows - array.all if all the first index of array are true 

def squarocol?(arr)
    num = arr.length

    arr.each do |row|
        return true if row.all? { |ele| ele == row[0] }
    end 

    i = 0 
    while i < num 
        return true if arr.all? { |ele| ele[i] == arr[0][i] }
        i += 1
    end 

    false 
end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) 
# false

# squaragonal?
# Write a method squaragonal? that accepts 2-dimensional array as an argument. The method should return a boolean indicating whether or not the array contains all of the same element across either of its diagonals. You may assume that the 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.

# Examples
#write a loop that iterates through each array to see if diagonal positions are equivalent
# 0,0 1,1 2,2 3,3 etc. -1,-1, -2,-2...

def squaragonal?(arr)
    return true if diagonal_right(arr) || diagonal_left(arr)
    false
end

def diagonal_right(arr)
    i = 0
    while i < arr.length - 1
        if !(arr[i][i] == arr[i+1][i+1])
            return false
        end
        i += 1
    end
    return true
end

def diagonal_left(arr)
   i2 = -1
    i3 = 0
    while i2 > - (arr.length) 
         if !(arr[i3][i2] == arr[i3+1][i2-1])
            return false
        end
        i2 -= 1
        i3 += 1
    end
    return true
end


# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

# pascals_triangle
# Pascal's triangle is a 2-dimensional array with the shape of a pyramid. The top of the pyramid is the number 1. To generate further levels of the pyramid, every element is the sum of the element above and to the left with the element above and to the right. Nonexisting elements are treated as 0 when calculating the sum. For example, here are the first 5 levels of Pascal's triangle:

#       1
#      1 1
#     1 2 1
#    1 3 3 1
#   1 4 6 4 1
# Write a method pascals_triangle that accepts a positive number, n, as an argument and returns a 2-dimensional array representing the first n levels of pascal's triangle.

#helper method that figures out what the next level is 
#method that makes the pyramid 
#create a peak of one 
#shovel the next level

#take in an array as an arg
#use a loop to make it as long as it needs to be 


def pascals_triangle(num)
    pascals = [[1]]

    while pascals.length < num 
        pascals << next_level(pascals[-1])
    end 

    pascals
end 

def next_level(arr)
    next = []
    arr << 0 #[1,2,1,0]

    arr.each_with_index do |num, idx|
        if !arr[idx+1].nil?
            next << num + arr[idx+1]
        else
            return next 
        end
    end

end

# Examples
#first is always a 1
# add to next level 
#

p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]





# def pyramid_sum(base)
#   new_arr = [base]
  
#   while new_arr.length < base.length
#     new_arr.unshift(adjacent_sum(new_arr[0])) 
#       end
  
#   return new_arr
# end

# def adjacent_sum(arr)
#   result = []
  
#   arr.each_with_index do |num, idx|
#     if idx < arr.length - 1 
#       result << num + arr[idx + 1]
#     end 
#   end 
  
#   return result 
# end 

# def pascals_triangle(n)
#     # get first two rows set up 
#     # add rows until we hit n
#     # each row follows this pattern
#         # starts with 1
#         # add up consecutive nums from previous row
#         # end it with 1
#     results = [
#         [1]
#     ]
#     while results.length < n
#         new_row = []
#         prev_row = results[-1]
#         new_row << 1
#         (0...prev_row.length - 1).each do |idx|
#             new_row << prev_row[idx] + prev_row[idx+1]
#         end
#         new_row << 1
#         results << new_row
#     end
#     results
# end

def matrix_addition(mat_1, mat_2)
    height = mat_1.length
    width = mat_1[0].length
​
    res = Array.new(height) {Array.new(width, 0)}
​
    (0...height).each do |idx1|
        (0...width).each do |idx2|
            res[idx1][idx2] = mat_1[idx1][idx2] + mat_2[idx1][idx2]
        end 
    end 
​
    res
end
​
def matrix_addition_reloaded(*matrices)
    height = matrices[0].length
    width = matrices[0][0].length
​
    res = Array.new(height) { Array.new(width, 0) }
​
    matrices.inject(res) do |acc, mat|
        return nil if mat.length != height || mat[0].length != width
        matrix_addition(acc, mat)
    end
​
end
​
def squaragonal?(matrix)
    diag_1 = []
    diag_2 = []
​
    (0...matrix.length).each do |idx|
        diag_1 << matrix[idx][idx]
​
        diag_2 << matrix[idx][matrix.length - 1 - idx]
    end 
​
    diag_1.all? {|el| el == diag_1[0]} || diag_2.all? {|el| el == diag_2[0]}
end 
Collapse



:+1:
2

