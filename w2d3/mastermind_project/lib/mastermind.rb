require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length) 
    end

    def print_matches(other_code)
        p @secret_code.num_exact_matches(other_code)
        p @secret_code.num_near_matches(other_code)
    end 

    def ask_user_for_guess
        puts "Enter a code"
        input = gets.chomp
        guess = Code.from_string(input)
        p print_matches(guess)

        @secret_code == guess


    end




end
