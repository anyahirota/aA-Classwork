class ComputerPlayer

    attr_reader :player_mark

    def initialize(mark_value)
        @player_mark = mark_value
    end 

    def get_position(positions)
        chosen_position = positions.sample
        p "Computer player #{@player_mark} chose position #{chosen_position}."
        chosen_position
    end 
end 