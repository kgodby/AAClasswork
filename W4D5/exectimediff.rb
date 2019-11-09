
def bad_min(list)
  list.each do |ele1|
    return ele1 if list.all? { |ele2| ele1 <= ele2 }
  end
end



def my_min(list)
  min = list.first
  list.each do |ele|
    min = ele if ele < min
  end
  min
end

list = [ 0, 3, 5, 4, -50, 10, 1, 90, -20, -10, 51 ]


#  p my_min(list)   
#  p bad_min(list)

def largest_contiguous_sum(list)
  sub_array = []

  (0...list.length).each do |i|
    (i...list.length).each do |j|
      sub_array << list[i..j]
    end
  end
sub_array.map { |sub| sub.sum }.max
end
# list = [5,3,-7]
p largest_contiguous_sum(list)

list2 = [-5, -1, -3]

def biggggg(list)
  current_sum = 0
  max_sum = nil
  list.each do |num|
    current_sum += num
    if max_sum == nil || current_sum > max_sum
      max_sum = current_sum
    end
    if current_sum < 0
      current_sum = 0
    end
  end
  max_sum
end


p biggggg(list2)