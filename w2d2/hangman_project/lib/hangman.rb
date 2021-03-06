class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
   
  def self.random_word
    DICTIONARY.sample
  end 

  def initialize()
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) {'_'} 
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else 
      false
    end 
  end 

  def get_matching_indices(char)
    result = []
    @secret_word.each_char.with_index do |ele, i|
      if ele == char
        result << i
      end
    end

    result
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end 

  def try_guess(char)
    if already_attempted?(char)
      p 'that has already been attempted'
      return false
    else
      @attempted_chars << char
      indices = get_matching_indices(char)
      if indices.length < 1
        @remaining_incorrect_guesses -= 1
      else 
        fill_indices(char, indices) 
      end

      return true
    end

  end

  def ask_user_for_guess
    p "Enter a char:"
    input = gets.chomp
    try_guess(input) 
  end 

  def win?
    if @guess_word.join == @secret_word
      p 'WIN'
      return true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0 
      p "LOSE"
      return true 
    else 
      false 
    end 
  end

  def game_over?
    if win? || lose?
      p @secret_word
      return true
    else
      false
    end
  end

end
