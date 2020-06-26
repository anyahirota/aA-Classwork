def remove_dups(array)
    array.uniq
end

def two_sum(array)
    raise 'Argument Error' if !array.is_a?(Array)
    new_arr = []
    (0..array.length-1).each do |idx|
        (idx..array.length-1).each do |idx2|
            if array[idx] + array[idx2] == 0 && idx2 > idx
            new_arr << [idx, idx2]
            end 
        end
    end 
    new_arr
end 

def my_transpose(array)
    array.transpose
end

def stock_picker(array) #[10, 3, 4, 8, 12]
    new_arr = []
    most_profitable = 0
    (0..array.length-1).each do |idx|
        (idx..array.length-1).each do |idx2|
            profitable = [idx, idx2]
            if array[idx2] - array[idx] > most_profitable && idx2 > idx
                most_profitable = array[idx2] - array[idx]
                new_arr = profitable
            end 
        end
    end 
    new_arr
end 
