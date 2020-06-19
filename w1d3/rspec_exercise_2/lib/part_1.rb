

#iterate through the array.
#make 2d array with 2 empty arrays
    #if arr element is less than the number we'll shovel it into the first array via index
    #otherwise we'll use else to shovel into second array


def partition(array, num)
    new_array = [[],[]]

    array.each do |ele|
        if ele < num
            new_array[0] << ele
        else
            new_array[1] << ele
        end
    end
    new_array
end

#create new hash equal to new hash dupe?
#iterate through the second hash. If the first hash includes the key that we're iterating over, we can set the value to the value in hash2
# if it doesn't exist, then we'll add k & v from hash 2 to the dupe

def merge(hash1, hash2)
    result = hash1.dup
    hash2.each {|k, v| result[k] = v}
    result
end

#split the sentence 
#iterate over words to see if they are include? in curse words array 
#if yes, replace the vowels with stars - define helper method that removes vowel and replace with *
#use map to iterate over map 
#join
#upcase and downcase in sentence

def censor(sent, curses)
    words = sent.split(" ")

    words.map! do |word|
        if curses.include?(word.downcase) 
            remove_vowels(word)
        else 
            word
        end
    end

    return words.join(" ")
end 

def remove_vowels(word) 
    vowels = "aeiouAEIOU"
    new_word = ""

    word.each_char do |char|
        if vowels.include?(char)
            new_word += "*"
        else 
            new_word += char
        end
    end 

    new_word
end

#always positive 
#start at 1 go up to num 
#every integer - see if integer times itself == num  - true 
#after iterate return false 


def power_of_two?(num)
    (0..num).each do |int|
        if 2**int == num 
            return true
        end 
    end 

    false 
end 


