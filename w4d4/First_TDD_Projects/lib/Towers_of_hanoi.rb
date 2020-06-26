class Towers
    attr_reader :disc_num, :arr1, :arr2, :arr3, :winning_arr
    
    def initialize(disc_num)
        @disc_num = disc_num
        @arr1 = (1..disc_num).to_a 
        @arr2 = []
        @arr3 = []
        @winning_arr = (1..disc_num).to_a
    end


    def move(start_arr, end_arr) 
        raise "invalid start" if !["1","2","3"].include?(start_arr)
        if start_arr == "1"
            start_arr = @arr1
        elsif start_arr == "2"
            start_arr = @arr2
        else 
            start_arr = @arr3
        end 

        raise "invalid end" if !["1","2","3"].include?(end_arr)
        if end_arr == "1"
            end_arr = @arr1
        elsif end_arr == "2"
            end_arr = @arr2
        else 
            end_arr = @arr3
        end 

        if end_arr.empty? && !start_arr.empty? || start_arr.first < end_arr.first 
            first_ele = start_arr.shift
            end_arr.unshift(first_ele)
        else 
            raise "invalid move"
        end
    end 

    def won?

    end

end

