class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max + 1, false)
  end

  def insert(num)
    if num >= 0 && num < @store.length
      @store[num] = true
      return true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    @store[num] = false if self.include?(num) 
  end

  def include?(num)
    if num >= 0 && num < @store.length && @store[num] == true
      return true
    else
      return false
    end
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
   self[num] << num unless self[num].include?(num)
  end

  def remove(num)
    self[num].delete(num) if self[num].include?(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
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
     unless self[num].include?(num)
      self[num] << num
      @count += 1
      resize! if @count > num_buckets
    end
    
  end

  def remove(num)
      if self[num].include?(num)
        self[num].delete(num)
        @count -= 1
      end
  end

  def include?(num)
    self[num].include?(num)
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
    arr = Array.new(num_buckets * 2) { Array.new }
    @store.each do |bucket|
      bucket.each do |num|
        arr[num % arr.length] << num
      end
    end
  

  @store = arr

  end
end
