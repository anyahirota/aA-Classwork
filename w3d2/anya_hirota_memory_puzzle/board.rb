require_relative "card"

#size of grid @size
#@grid 
#populate
#render
#won?
#reveal
#guessed_pos
#[](pos)
#[]=(pos, value)

class Board

    attr_reader :grid, :size 

    def initialize(n)
        if n.odd?
            raise "n MUST be even!!!!"
        end 

        @grid = Array.new(n) {Array.new(n, nil)}
        @size = n * n
        @cards = []
        alpha = ("a".."z").to_a 

        i = 0 
        while @cards.length < @size
            letter = alpha[i].upcase
             @cards.concat([Card.new(letter), Card.new(letter)])
             i += 1
        end  

        self.populate
    end 

    def [](pos)
        y, x = pos 
        @grid[y][x]
    end

    def []=(pos, value)
        y, x = pos 
        @grid[y][x] = value 
    end

    def populate  #consider calling this method in the initialize methof for this class 
        
        i = 0
        while i < @cards.length
            rand_x = rand(@grid.length) 
            rand_y = rand(@grid.length) 
            if !self[[rand_x, rand_y]]
                self[[rand_x, rand_y]] = @cards[i]
                i += 1
            end 
        end  
    end 

    def render
        printable_grid = @grid.map do |row| 
            row.map do |card|
                if card.up
                    card = card.value
                else 
                    card = "_"
                end 
            end
        end

        printable_grid.each { |row| puts row.join(" ") } 
    end 
    
    
    def won? 

        @grid.flatten.all? { |card| card.up }
    end

    def reveal(guess_pos)
        self[guess_pos].up = true 
        self[guess_pos].value
    end 

    def guessed_pos
        p "Enter position (example: row# col#)"
        input = gets.chomp
        return input.split(" ").map(&:to_i)    
    end 

end 

#create card instances - size - but need two of same value
#randomly place the positions until all are placed #while @grid.empty_positions?
#do we need empty space method? - check if empty 

