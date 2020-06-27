def first_anagram?(str1, str2)
    arr = str1.split("")
    perms = permutations(arr)
    perms.map! {|ele| ele.join }
    p perms
    perms.include?(str2)
end  




 # recursion
 #base case string as single element or empty
 # add first or last position of of previous frame to every spot of current string


def permutations(array)
    return [[]] if array.empty?

    first_ele = array.first

    perms = permutations(array[1..-1])
    result = []
    perms.each do |perm|
        (0...array.length).each do |i|
            result << perm[0...i] + [first_ele] + perm[i..-1]
        end
    end
    result
end


#  p first_anagram?("gizmo", "sally") 
#  p first_anagram?("elvis", "lives") 


def second_anagram?(str1, str2)
    str1.each do |ele|
    end
end
    