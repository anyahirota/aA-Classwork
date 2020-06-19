def select_even_nums(arr)
    arr.select(&:even?)
end 


def reject_puppies(dogs)
    dogs.reject { |h| h["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.map! { |sub_arr| sub_arr.sum }
    arr.count {|sub_arr| sub_arr > 0 }
end

def aba_translate(str)
    vowels = "aeiou"
    chars = str.split("")
    new_chars = chars.map do |char| 
        if vowels.include?(char)
            char + "b" + char
        else 
            char
        end 
    end 

    new_chars.join("")
end 

def aba_array(arr)
    arr.map { |str| aba_translate(str) }
end
