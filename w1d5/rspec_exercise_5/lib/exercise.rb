# check the input argument for the same length across all arguments
# iterating through the input argument at a specific index and collecting that specific index into that arr...


def zip(*arr)
    new_arr = Array.new(arr[0].length) {Array.new}   #-> [[1],[2]]
    arr.each_with_index do |ele1,idx1|    #arr = [[1,2,3],[a,b,c]] , ele < [1,2,3]
        arr[idx1].each_with_index do |ele2, idx2|
            new_arr[idx2] << arr[idx1][idx2] #new_arr[1] << arr[0][1]
        end
    end
    new_arr

    # n = 0
    # while n < new_arr.length
    #     arr.each do |ele|
    #         new_arr[n] << ele[n]   # for the index in new_arr, you grab the element from the same indx in arr
    #     end
    #     n += 1
    # end
    # new_arr
end 

def prizz_proc(arr, prc1, prc2)
    new_arr = []
    arr.each do |ele|
        new_arr << ele if (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))
    end 
    new_arr 
end

def zany_zip(*arr)
    count = arr.inject(0) do |acc, ele| 
        if ele.length > acc
            ele.length
        else
            acc
        end
    end

    new_arr = Array.new(count) {Array.new(arr.length,nil)} #-> [[[],[],[]],[],[],[],[]]
    arr.each_with_index do |ele1,idx1|    #arr = [[1,2,3],[a,b,c]] , ele < [1,2,3]
        arr[idx1].each_with_index do |ele2, idx2|
            new_arr[idx2][idx1] = arr[idx1][idx2] #new_arr[1][0] = arr[0][1]
        end
    end
    new_arr
end

# array_1 = ['a', 'b', 'c']
# array_2 = [1, 2, 3]
# array_3 = [11, 13, 15, 17]
# array_4 = ['v', 'w', 'x', 'y', 'z']

# p zany_zip(array_3, array_2, array_1)


def maximum(arr, &prc)
    return nil if arr.empty?
    # new_arr = [arr[0]]

    # arr.each do |ele|
    #     new_arr[0] = ele if prc.call(ele) >= prc.call(new_arr[0])
    # end
    # new_arr[0]


    new_arr = []

    arr.each do |ele|
        new_arr << prc.call(ele)
    end

    arr.reverse!.each do |ele|
        if prc.call(ele) == new_arr.max
            return ele
        end
    end
end

def my_group_by(arr, &prc)
    hash = Hash.new() {|h, k| h[k] = []}
    arr.each do |ele|
        key = prc.call(ele)
        hash[key] << ele
    end
    hash
# end 

# def max_tie_breaker(arr, prc, &blc)
#     return nil if arr.empty?

#     new_arr = [arr[0]]
#     arr.each do |ele|
#         if blc.call(ele) > blc.call(new_arr[0])
#             new_arr[0] = ele
#         elsif blc.call(ele) == blc.call(new_arr[0])
#             new_arr << ele
#         end 
#     end

#     # new_arr[0]

#     if new_arr.length > 1 
#         if prc.call(new_arr[0]) > prc.call(new_arr[1])
#             return new_arr[0]
#             # if prc.call(ele) > prc.call(new_arr[i+1])
#             #     return ele
#             # else
#             #     return new_arr[i+1]
#             # end
#         elsif prc.call(new_arr[0]) =< prc.call(new_arr[1])
#             return new_arr[1]
#         end
#     else
#         new_arr[0]
#     end

# # end

# def silly_syllables(sent)
#     words = sent.split(" ")

#     longer_words = words.reject { |word| word.length < 2 }
    
#     front_new_words = []
#     vowels = "aeiou"
#     longer_words.each do |word|
#         word.each_char.with_index do |char, i|
#             if vowels.include?(char)
#                 front_new_words << word[i..-1]
#                 break
#             end 
#         end
#     end 

#     final_new_words = []
#     front_new_words.each do |word|
#         word.reverse!.each_char.with_index do |char, i|
#             if vowels.include?(char)
#                 final_new_words << word[i..-1].reverse!
#                 break
#             end 
#         end
#     end 

#     final_new_words.join(" ")
# end 