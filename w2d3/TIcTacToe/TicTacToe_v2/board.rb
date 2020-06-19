class Board
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, "_")}

    end

    def valid?(position) #[x,y]
        if (position[0] > @grid.length || position[1] > @grid.length) || (position[0] < 0 || position[1] < 0)
            return false
        else 
            true
        end
    end 

    def empty?(position) #[x,y]
      @grid[position[0]][position[1]] == "_"  
    end

    def place_mark(position, mark)
        if self.empty?(position) && self.valid?(position)
             @grid[position[0]][position[1]] = mark
        else 
            raise "position not available"
        end
    end 

    def print
        @grid.each do |row|
            puts row.join(" ")
        end 
    end 

    def win_row?(mark)
        @grid.any? do |row|
            row.all? { |el| el == mark }
        end 
    end 

    def win_col?(mark)
        @grid.transpose.any? do |col| 
            col.all? { |el| el == mark }
        end
    end 

    def win_diagonal(mark)
        diag_1 = []
        diag_2 = []

        (0...@grid.length).each do |idx|
            diag_1 << @grid[idx][idx]

            diag_2 << @grid[idx][@grid.length - 1 - idx]
        end 

        diag_1.all? {|el| el == mark} || diag_2.all? {|el| el == mark}
    end

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal(mark)
    end

    def empty_positions?
        @grid.flatten.any? {|el| el == "_"}
    end 


end