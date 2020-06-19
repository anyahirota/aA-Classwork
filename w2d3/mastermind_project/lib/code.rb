class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr) #can also use array.all?
    arr.each do |el|
      if !POSSIBLE_PEGS.has_key?(el.upcase)
        return false
      end
    end 
    true
  end 

  
  def self.random(num) 
    arr = Array.new(num)
    arr.each_with_index do |ele, i|
      arr[i] = POSSIBLE_PEGS.keys.sample
    end
    Code.new(arr)
  end 

  # arr = []
  # num.times do
  # arr << POSSIBLE_PEGS.keys.sample
  # end 


  def self.from_string(str)
    arr = str.split("")
    Code.new(arr)
  end 

  # Code.new(str.split(""))


  def  initialize(arr_char)
    if Code.valid_pegs?(arr_char)
      @pegs = arr_char.map(&:upcase)
    else
      raise "not valid"
    end
  end


  def pegs
    @pegs
  end


  def [](idx)
    @pegs[idx]
  end


  def length
    @pegs.length
  end 

  #part2

  def num_exact_matches(guess)
    count = 0
    guess.pegs.each_with_index do |el, i|
      if @pegs[i] == guess.pegs[i] 
        count += 1
      end 
    end   
    count
  end
  
  def num_near_matches(guess)
    count = 0
      guess.pegs.each_with_index do |el, i|
      if !(@pegs[i] == guess.pegs[i]) && @pegs.include?(el)
        count += 1
      end 
    end  
    count
  end

  def ==(other_code)
    other_code.pegs == @pegs
  end 


end
