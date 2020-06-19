def average(num_1, num_2)
    sum = num_1 + num_2
    sum / 2.0
end

def average_array(arr)
    arr.sum(0.0) / arr.length
end

def repeat(str, num)
    str * num 
end 

def yell(str)
    str.upcase + "!"
end

def alternating_case(sent)

    new_words = []

    words = sent.split(" ")
    words.each_with_index do |word, i|
        if i % 2 == 0
            new_words << word.upcase
        else
            new_words << word.downcase
        end
    end 

    return new_words.join(" ")
end
