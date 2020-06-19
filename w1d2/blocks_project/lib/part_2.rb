def all_words_capitalized?(arr)
    arr.all? { |word| word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase }
end

def no_valid_url?(urls)
    endings = ['.com', '.net', '.io', '.org']
    urls.none? do |url| 
        endings.any? { |ending| url.end_with?(ending) } 
    end 
end 

def any_passing_students?(students)
    students.any? { |student| (student[:grades].sum) / 2 >= 75 }
end
