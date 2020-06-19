require 'byebug'

class Array
    
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    # a = [1,2,3]
    # { |num| num > 1 }

    def my_select(&prc)
        new_arr = []
        self.my_each { |ele| new_arr << ele if prc.call(ele) }
        new_arr 
    end 

    def my_reject(&prc)
        new_arr = []
        self.my_each { |ele| new_arr << ele if !prc.call(ele) }
        new_arr 
    end

    def my_any?(&prc)
        count = 0 
        self.my_each { |ele| count += 1 if prc.call(ele) }
        count > 0 
    end 

    def my_all?(&prc)
        count = 0 
        self.my_each { |ele| count += 1 if prc.call(ele) }
        count == self.length
    end 

    
    def my_flatten
        return [self] if !self.is_a?(Array) 
        new_arr = []
        self.each do |array|# [1,2,[3,4] ]
            if !array.is_a?(Array)
                new_arr << array
            else
                new_arr += array.my_flatten
            end
        end
        new_arr
    end

    # loop thru self, put ele into new array, loop thru other arrays, put eles into same array
    def my_zip(*arrays)
        new_array = Array.new(self.length) {Array.new(arrays.length + 1, nil)}
        self.each_with_index do |num1, i| 
            self_index = 0
            new_array[i][self_index] = num1
            self_index += 1
            arrays.each do |num2|
                new_array[i][self_index] = num2[i]
                self_index += 1
            end 
        end   
        new_array
    end 

    #see if num pos or neg
    def my_rotate(num=1)
        new_array = self.dup
        if num > 0
            num.times do
                front_ele = new_array.shift
                new_array << front_ele
            end
        else
            (-num).times do
                back_ele = new_array.pop
                new_array.unshift(back_ele)
            end
        end
        new_array
    end

    def my_join(sep = nil)
        sep ||= ""
        new_str = ""
        self.each do |letter|
            new_str += letter 
            new_str += sep
        end 
        new_str
    end 

    def my_reverse
        new_arr = []
        self.each do |ele|
            new_arr.unshift(ele)
        end
        return new_arr
    end

    def factors(num)
        self.select { |factor| num % factor == 0 }
    end 
    
    def bubble_sort!(&prc)
        sorted = false
        while !sorted
            sorted = true
            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i + 1]) == 1
                    self[i], self[i + 1] = self[i + 1], self[i]
                    sorted = false
                end
            end
        end
        return self
    end 
    
    def bubble_sort(&prc)
        sorted = false
        new_array = self.dup
        while !sorted
            sorted = true
            (0...new_array.length - 1).each do |i|
                if prc.call(new_array[i], new_array[i + 1]) == 1
                    new_array[i], new_array[i + 1] = new_array[i + 1], new_array[i]
                    sorted = false
                end
            end
        end
        return new_array
    end 
    
    
    
end

# dictionary = []
# string = 'apple'
# sub_array = ['a', 'ab', 'ap', 'app', 'ple'] # => 

# p sub_array.substrings(string)

# unsorted = ['a', 'c', 'z', 'm', 'b'] # => ['a', 'b', 'c', 'm', 'z']
# nums = [1, 10, 38, 22, 4, 17] # => [1, 4, 10, 17, 22, 38]

# # p unsorted.bubble_sort! { |a, b| a <=> b }
# # p nums.bubble_sort! { |a, b| a <=> b }

# p unsorted
# p unsorted.bubble_sort { |a, b| a <=> b }
# p nums 
# p nums.bubble_sort { |a, b| a <=> b }

# a = [1, 2, 3, 4, 5]
# p a.factors(10) # => [1, 2, 5]
# p a.factors(12) # => [1, 2, 3, 4]
# p a.factors(17) # => []

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]



# return_value = [1, 2, 3]

# return_value.my_each do |num|
#   puts num
# end

# p return_value  # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true


# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

def substrings(string)
    new_array = []
    (0...string.length).each do |start_index|
        (start_index...string.length).each do |end_index|
            new_array << string[start_index..end_index]
        end
    end
    return new_array
end

def subwords(word, dictionary)
    dictionary.select {|ele| word.include?(ele)}
end 

string = 'abracadabra' # a ab abr 

p substrings(string)

# dictionary = ['cat', 'dog', 'bat']
# word = 'catkljlkjelkjdoglkjlj'

# p subwords(word, dictionary)