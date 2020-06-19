require_relative "./board.rb"
require_relative "./human_player.rb"

class Game

    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @current_player = @player_1
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else 
            @current_player = @player_1
        end 
    end 

    def play
        b = Board.new
        until !b.empty_positions? do #board instance 
            b.print
            position = @current_player.get_position 
            b.place_mark(position, @current_player.player_mark)
            if b.win?(@current_player.player_mark)
                p "#{@current_player.player_mark} has won!"
                return
            else 
                self.switch_turn
            end 
        end  
        
        p "It's a draw!"
    end 





end 