require 'tdd'

describe "my_uniq" do
  it "should only accept an array" do
    expect { my_uniq("hello") }.to raise_error ( TypeError )
  end

  it "removes duplicates from an array" do
    expect(my_uniq([1, 2, 1, 3, 3])).to eq([1, 2, 3])
  end

  it "returns unique elements in the order they appear" do
    expect(my_uniq([5,3,3,7,7,1])).to eq([5,3,7,1])
  end

  it "should return a new array" do
    expect(my_uniq([1, 2, 1, 3, 3])).to_not be([1, 2, 3])
  end
end


describe "two_sum" do
  it "should return indices of all pairs in the array that sum to 0" do
    expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0, 4], [2, 3]]) 
  end

  it "should return each pair sorted with smaller index before bigger index" do
    expect(two_sum([-4, 0, 4, 1, -1])).to eq([[0, 2], [3, 4]]) 
  end
  
  it "should return the array of pairs sorted dictionary wise" do
    expect(two_sum([1, 2, -2, -1, -1])).to eq([[0,3],[0,4], [1, 2]])
  end
end

describe "my_transpose" do
  it "should transpose a square 2d array" do
    expect(my_transpose([ [0,1,2], [3,4,5], [6,7,8]])).to eq([[0,3,6], [1,4,7], [2,5,8] ])
  end
end

describe "stock_picker" do
  it "should accept an array of integers" do
    expect{stock_picker("hello")}.to raise_error (TypeError) 
  end
  
  it "should return the two indices of the values with the greatest difference between them" do
    expect(stock_picker([1,2,3,4,5])).to eq([0,4])
  end
  
  it "should return the indices in the order they appear" do
    expect(stock_picker([8,2,4,5,3,1])).to eq([1,3])
  end


end