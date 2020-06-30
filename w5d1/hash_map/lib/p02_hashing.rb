class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    #first ele be the one side of xor
    return 0.hash if self.empty?   
    result = ''
    
    (0...self.length).each do |i|
      result += (i ^ self[i]).to_s(2)
    end 
    result.to_i.hash 
  end
end

class String
  def hash
    alpha = ('a'..'z').to_a
    newA = []

    self.each_char do |char|
      newA << alpha.index(char.downcase)
    end
    newA.hash
  end
end


class Hash 
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # result = []
    # arr = hash.sort_by {|k,v| v}
    # arr.each do |ele| 
    #   result << ele.to_s.hash 
    # end 
    # result.hash 
    0
  end
end

