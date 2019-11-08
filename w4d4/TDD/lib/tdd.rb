def my_uniq(array)
  raise TypeError unless array.is_a?(Array)

  ele_count = Hash.new(0)
  array.each { |ele| ele_count[ele] += 1 }
  ele_count.keys
end

def two_sum(arr)
  result = []
  arr.each_with_index do |ele1, i|
    (i + 1...arr.length).each do |j|
      result << [i,j] if ele1 + arr[j] == 0
    end
  end
  result
end

def my_transpose(arr)
  i = 0
  result = []

  while i < arr[0].length
    temp = []
    arr.each do |row|
      temp << row[i]
    end
    result << temp
    i+= 1
  end
  result
end

def stock_picker(arr)
  greatest = nil
  arr.each_with_index do |first, i|
    (i + 1...arr.length).each do |j|
      if arr[j] - first > greatest || greatest.nil?
        result = [i,j]
        greatest = arr[j] - first
      end
    end
  end
  result
end