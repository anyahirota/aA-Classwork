# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        if self.empty?
            nil
        else
            self.max - self.min
        end
    end

    def average
        if self.empty?
            nil
        else
            self.sum / self.length.to_f
        end
    end

    def median
        middle_idx_low = ((self.length - 1) * 0.5).floor
        middle_idx_high = ((self.length - 1) * 0.5).ceil
        
        sorted = self.sort

        if self.empty?
            nil
        else 
            (sorted[middle_idx_low] + sorted[middle_idx_high]) * 0.5
        end
    end

    def counts
        hash = Hash.new(0)
        self.each { |ele| hash[ele] += 1 }
        hash
    end

    def my_count(ele)
        self.counts[ele]
    end

    def my_index(ele)
        (0...self.length).each do |i|
            return i if self[i] == ele
        end
        nil
    end

    def my_uniq
        self.reject.with_index { |ele,i| self[0...i].include?(ele) }
    end

    def my_transpose
        size = self.length
        columns = Array.new(size) { Array.new(size) }
        (0...size).each do |i|
            (0...size).each do |j|
                columns[i][j] = self[j][i]
            end
        end
        columns
    end

end
