def reverser(str, &prc)
    prc.call(str.reverse!)
end 

def word_changer(sentence, &prc)
    words = sentence.split(" ")
    new_words = words.map { |word| prc.call(word) }
    new_words.join(" ")
end 

def greater_proc_value(num, prc1, prc2)
    if prc1.call(num) > prc2.call(num)
        return prc1.call(num)
    else 
        return prc2.call(num)
    end
end

def and_selector(arr, prc1, prc2)
    arr.select { |ele| prc1.call(ele) && prc2.call(ele) }
end 

def alternating_mapper(arr, prc1, prc2)
    arr.map do |ele|
        if arr.index(ele).even?
            prc1.call(ele)
        else 
            prc2.call(ele)
        end
    end 
end 
