def hipsterfy(str)
    vowels = "aeiou"

    i = str.length - 1
    while i >= 0
        if vowels.include?(str[i])
            return str[0...i] + str[(i+1)..-1]
        end

        i -= 1
    end

    return str 

end


def vowel_counts(str)
    vowels = "aeiou"
    counts = Hash.new(0)

    str.downcase.each_char do |char|
        if vowels.include?(char)
            counts[char] += 1
        end 
    end 

    return counts
end


def caesar_cipher(str, n)
    new_str = ""
    alphabet = "abcdefghijklmnopqrstuvwxyz"

    str.each_char do |char|
        if alphabet.include?(char)
            new_idx = alphabet.index(char) + n
            new_str += alphabet[new_idx % 26]
        else
            new_str += char
        end
    end

    new_str
end