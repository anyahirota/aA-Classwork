# PHASE 2

def convert_to_int(str)
  Integer(str)  
rescue ArgumentError => err 
  puts "#Error was: #{err.message} "
  return nil 
  
  
end

# PHASE 3
#user feeds monster 
#if its a fruit - no error
#if its not a fruit - error
#if its coffee - error + retry 

class WrongFoodError < StandardError
  def message
    return "Argh!I hate the food! Give me fruit!"
  end 
end

class CoffeeError < StandardError
  def message
    return "Thanks for the coffee. Please feed me food too!"
  end 
end

FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee" 
   raise CoffeeError
  else 
   raise WrongFoodError
  end
end 
    
def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError => err
    puts err.message
    retry
  rescue WrongFoodError => err
    puts err.message
  end 
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end
  
  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


#  begin
    #   sqrt(num)
    # rescue ArgumentError => e
    #   puts "Couldn't take the square root of #{num}"
    #   puts "Error was: #{e.message}"
    # end

#     class BestFriend
#   def initialize(name, yrs_known, fav_pastime)
#     raise ArgumentError.new("'name' cannot be blank") if name.empty?
#     raise ArgumentError.new("'yrs_known' must be greater than or equal to 5 (best friendships take time)") if yrs_known.to_i < 5
#     raise ArgumentError.new("'fav_pasttime' cannot be blank") if fav_pastime.empty?

#     @name = name
#     @yrs_known = yrs_known.to_i
#     @fav_pastime = fav_pastime
#   end

#   def talk_about_friendship
#     puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
#   end

#   def do_friendstuff
#     puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
#   end

#   def give_friendship_bracelet
#     puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
#   end
# end

