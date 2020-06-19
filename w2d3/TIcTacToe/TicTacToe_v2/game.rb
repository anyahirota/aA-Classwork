require_relative "./board.rb"
require_relative "./human_player.rb"

class Game

    def initialize(board_size, *player_marks)
        @board = Board.new(board_size)
        @players = []
        player_marks.each {|mark| @players << HumanPlayer.new(mark)}

        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0] 
    end 

    def play
        until !@board.empty_positions? do #board instance 
            @board.print
            position = @current_player.get_position 
            @board.place_mark(position, @current_player.player_mark)
            if @board.win?(@current_player.player_mark)
                p "#{@current_player.player_mark} has won!"
                return
            else 
                self.switch_turn
            end 
        end  
        
        p "It's a draw!"
    end 





end 