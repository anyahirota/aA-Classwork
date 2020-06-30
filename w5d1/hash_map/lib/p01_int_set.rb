class MaxIntSet
  attr_reader :store
  def initialize(max) 
    @store = Array.new(max+1) {false}
  end

  def insert(num)
    raise "Out of bounds" if num > @store.length - 1 || num < 0
    @store[num] = true
  end

  def remove(num)
    store[num] = false
  end

  def include?(num)
    return false if store[num] == false
    true
  end

  private

  def is_valid?(num) 
  end

  def validate!(num)
  end

end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] << num 
  end

  def remove(num)
    @store[num % num_buckets].delete(num)
  end

  def include?(num)
    return true if @store[num % num_buckets].include?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      @store[num % num_buckets] << num 
      @count += 1
      resize! if count == num_buckets
    end
  end

  def remove(num)
    if include?(num)
      @count -= 1
      @store[num % num_buckets].delete(num)
    end 
  end

  def include?(num)
    return false unless @store[num % num_buckets].include?(num)
    true
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
     @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) {Array.new}
    @store.flatten.each do |ele|
      new_store[ele % new_store.length ] << ele
    end
    @store = new_store
  end

end

