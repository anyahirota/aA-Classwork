require"byebug"
class Board
    attr_reader :size

    def self.print_grid(grid)
        grid.each do |row| 
            puts row.join(" ")   
        end
    end

    #     i = 0

    #     while i < grid.length 
    #         j = 0
    #         while j < grid.length
    #             if grid[i][j] == grid[i][-1]
    #                 print grid[i][j].to_s + "\n"
    #             else
    #                 print grid[i][j].to_s + " "
    #             end
    #             j += 1
    #         end
    #         i += 1
    #     end
    # end


    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end 

    def [](position)
        @grid[position[0]][position[1]]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
        # @grid[position] = value 
    end
    
    def num_ships
        @grid.flatten.count {|el| el == :S}
    end
    

    #part2

    def attack(position)
        if self[position] == :S
            self[position] = :H
            p "you sunk my battleship!"
            return true
        else 
            self[position] = :X
            false 
        end 
    end


    def place_random_ships
        while num_ships < (@grid.flatten.length / 4)
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            @grid[row][col] = :S 
        end
    end


    def hidden_ships_grid
        arr1 = Array.new(@grid.length) {Array.new(@grid.length)}
        @grid.each_with_index do |arr, i|
            arr.each_with_index do |el, j|
               if el == :S
                arr1[i][j] = :N
               else 
                arr1[i][j] = el
               end 
            end
        end 
        arr1
    end 
    #map within map 

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end 
end
