class HumanPlayer

    attr_reader :player_mark

    def initialize(mark_value)
        @player_mark = mark_value
    end 

    def get_position
        alpha = ("a".."z").to_a
        puts "Player #{self.player_mark}, please enter a position with the format, row col:"
        input = gets.chomp.split(" ")
        if input.length !=2 || input.any? {|el| alpha.include?(el)}  
            raise "input format incorrect"
        else  
            return input.map(&:to_i)
        end 
    end


end 