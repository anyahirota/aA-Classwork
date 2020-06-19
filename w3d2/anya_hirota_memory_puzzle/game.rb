#@board
#@prev_guess
#make_guess
#play - last thing
require_relative "board"
require_relative "card"

class Game 

    def initialize(length)
        @board = Board.new(length)
        @prev_guess = nil
        @previous_position = nil
    end 

    def make_guess(guess) 
        @board[guess].up = true 

        if !@prev_guess
            @prev_guess = guess 
            return false 
        elsif guess == @prev_guess
            @prev_guess = nil 
            return true
        elsif @prev_guess != guess
            @prev_guess = nil 
            return false 
        end 
    end 

    def play
        until @board.won? 
            @board.render 
            guess = @board.guessed_pos #[0, 0]
            @board[guess].up = true
           
            if @prev_guess == nil
                @prev_guess = @board[guess].value  #@previous_guess = [1, 2] #@previous_guess = "E"
                @previous_position = guess
            else

#possibly end the if statement, set previous guess to second guess, and then do next 
        #   else? 
                #second_guess = @board.guess_pos 
             

                if @prev_guess == @board[guess].value
                    @board[guess].up = true
                    @prev_guess = nil 
                    next 

                else  
                    @prev_guess = nil  
                    @board[@previous_position].up = false
                    @board[guess].up = true 
                    @board.render 
                    sleep(3)
                    system("clear")
                    @board[guess].up = false
                end 
            end
        end
        p "you won!" #sleep(num_secs)
    end 



end 

game = Game.new(2)
game.play