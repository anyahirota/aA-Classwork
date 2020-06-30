class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
       self[key.hash] << key
      @count += 1
      resize! if count == num_buckets
    end

  end

  def include?(key)
    return false unless self[key.hash].include?(key)
    true 
  end

  def remove(key)
    if include?(key)
      self[key.hash].delete(key)
      @count -= 1
    end 
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
