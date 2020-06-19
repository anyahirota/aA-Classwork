
# create reverse word. Iterate through word backwards using while loop
#once we have this new reverse word we can check and see if it is equal to origiinal word.

def palindrome?(word)
    new_word = ""
    i = word.length - 1

    while i >= 0
        new_word += word[i]
        i -= 1
    end

    new_word == word
end

# possibilities 
# iterate through each character 
#all substrings from the first character 
#nested loop?
#do that for each subsequent letter 
#slicing and nested loops with index 

def substrings(word)
    strings = []
    (0..word.length - 1).each do |idx1|
        (0..word.length - 1).each do |idx2|
            if idx2 >= idx1
            strings << word[idx1..idx2]
            end
        end 
    end 

    strings
end 


#call substring on string 
# take substrings and iterate through them
    #call palindrome method to check if each of those substrings are palindromes and we select into array
def palindrome_substrings(string)
    strings = substrings(string)

    strings.select {|ele| palindrome?(ele) if ele.length > 1}

end