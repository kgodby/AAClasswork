class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    a = 0
    self.each_with_index do |n, i|
      a ^= n.hash * 2**i
    end
    a
  end
end

class String
  def hash
    a = 0
    self.each_char.with_index do |c, i|
      a ^= c.ord * 2**i
    end
    a
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    a = 0
    self.each do |k,v|
      a ^= (k.hash * v.hash)
    end
    a
  end
end
