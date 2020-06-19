def duos(str)
    count = 0
    str.each_char.with_index {|char, i| count+= 1 if str[i] == str[i+1] }
    count
end 

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sent, hash)
    words = sent.split(" ")
    words.map! do |ele|
        if hash.has_key?(ele)
            ele = hash[ele]
        else 
            ele 
        end 
    end
    words.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hash, prc, &blc)
    new_hash = Hash.new {|h,k| h[k] = nil}
    hash.each do |k,v|
        new_hash[blc.call(k)] = prc.call(v)
    end 
    new_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(str)
    counter = Hash.new(0)
    str.each_char {|char| counter[char] += 1}
    counter.select! {|k,v| v > 2}
    counter.keys
end 

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(str)
    str.each_char.with_index {|char, i| return true if char == str[i + 1] && char == str[i +2] }
    false 
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(str, hash)
    chars = str.split("")
    new_str = []
    chars.each do |char|
        if hash.has_key?(char)
            new_str << hash[char]
        elsif char == " "
            new_str << char 
        else 
            new_str << "?"
        end   
    end 
    new_str.join("")
end 

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(str)
    long_str = ""
    
    i = 0
    while i < str.length - 1
        (str[i+1].to_i).times do 
        long_str += str[i] 
        end 
        i += 2
    end

    long_str
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(arr, *prcs)
    arr.select do |ele|
        prcs.all? {|prc| prc.call(ele)}
    end 
end 

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def latinize(word)
    vowels = "aeiou"

    if vowels.include?(word[0])
        return word + "yay"
    else 
        word.each_char.with_index do |char, i|
            return word[i..-1] + word[0...i] + "ay" if vowels.include?(char)
        end 
    end 
end 

def convert_pig_latin(sent)
    words = sent.split(" ")
    new_sent = []

    words.each do |word|
        if word.length < 3
            new_sent << word 
        elsif word == word.capitalize
            new_sent << latinize(word).capitalize
        else 
            new_sent << latinize(word)
        end 
    end

    new_sent.join(" ")

end 



# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sent)
    words = sent.split(" ")

    new_sent = []
    
   words.each do |word|
        if word.length < 3
            new_sent << word 
        elsif word == word.capitalize
            new_sent << changes(word).capitalize
        else 
            new_sent << changes(word)
        end 
    end

    new_sent.join(" ")
end

def changes(word)
    vowels = ["a","e","i","o","u"]
       
    return word *2 if vowels.include?(word[-1]) 
    
    i = word.length - 1
    while i >= 0
        if vowels.include?(word[i])
            return word + word[i..-1]
        end
        i-=1
    end 
end 

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(arr, *prcs)
    arr.select do |ele|
        prcs.any? {|prc| prc.call(ele)}
    end 
end 

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def first_vowel(word)
    vowels = "aeiou"
    word.each_char.with_index {|char, i| return word[0...i] + word[i+1..-1] if vowels.include?(char)}
    word
end 
# p first_vowel("please")

def last_vowel(word)
    vowels = "aeiou"
    reverse_word = word.reverse
    reverse_word.each_char.with_index {|char, i| return (reverse_word[0...i] + reverse_word[i+1..-1]).reverse if vowels.include?(char)}
    word
end 

# p last_vowel("animals")

def alternating_vowel(sent)
    vowels = "aeiou"
    words = sent.split(" ")
    new_sent = []

    words.each_with_index do |word, i|
        if i.even?
            new_sent << first_vowel(word) 
        else 
            new_sent << last_vowel(word)
        end 
    end 

    new_sent.join(" ")
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def aba(word)
    vowels = "aeiou"
    new_word = ""
    word.each_char do |char|
        if vowels.include?(char)
            new_word += char + "b" + char
        else 
            new_word += char
        end 
    end 
    new_word
end 

def silly_talk(sent)
    words = sent.split(" ")
    new_sent = []
    vowels = "aeiou"

    words.each do |word|
        if vowels.include?(word[-1])
            new_sent << word + word[-1]
        elsif word == word.capitalize 
            new_sent << aba(word.downcase).capitalize
        else 
            new_sent << aba(word)
        end 
    end 
    
    new_sent.join(" ")
end

p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(str)
    i = 0
    new_str = ""

    while i < str.length
        count = 1
        while str[i] == str[i+1]
            count += 1
        end 
        if count > 1 
            new_str += str[i] + count.to_s
        else 
            new_str += str[i]
        end 
        i+=1
    end 

    new_str
end 

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"



