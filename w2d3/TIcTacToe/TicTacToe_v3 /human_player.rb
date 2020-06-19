class HumanPlayer

    attr_reader :player_mark

    def initialize(mark_value)
        @player_mark = mark_value
    end 

    def get_position(legal_positions)
        alpha = ("a".."z").to_a
        puts "Player #{self.player_mark}, please enter a position with the format of your desired indices with a space in between: 'row# col#':"
        input = gets.chomp.split(" ")

        until legal_positions.include?(input.map(&:to_i)) do
            puts "Your choice was illegal. Please choose again."
            puts "Player #{self.player_mark}, please enter a position with the format of your desired indices with a space in between: 'row# col#':"
            input = gets.chomp.split(" ")
        end 

        input.map(&:to_i)
    end



end 