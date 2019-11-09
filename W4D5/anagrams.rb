require "byebug"

def permutations(str1)
  return [str1] if str1.length <= 1
  last = str1[-1]
  last_perm = permutations(str1[0..-2])
  perms = []
  last_perm.each do |perm|
    (0..last_perm.length).each do |i|
      perms << perm[0...i] + last + perm[i..-1]
    end
  end
  perms
end 

def first_anagram?(str1, str2)
  permutations(str1).any? { |perm| perm == str2}
end

def second_anagram?(str1, str2)
  # debugger
  str2_chars = str2.split("")
  str1.each_char do |char|
    i = str2_chars.index(char)
    return false if i == nil
    str2_chars.delete_at(i)
  end
  str2_chars.empty?
end


def alpha_sort(str)
  alpha = ("a".."z").to_a
  sorted = false
  until sorted == true
    sorted = true
    (0...str.length - 1).each do |i|
      if alpha.index(str[i]) > alpha.index(str[i + 1])
        sorted = false
        str[i], str[i + 1] = str[i + 1], str[i]
      end
    end
  end
  return str
end

def third_anagram?(str1,str2)
  alpha_sort(str1) == alpha_sort(str2)
end

def forth_anagram?(str1, str2)
  str1_hash = Hash.new(0)
  str2_hash = Hash.new(0)

  str1.each_char {|char| str1_hash[char] += 1}
  str2.each_char {|char| str2_hash[char] += 1}  
  str1_hash == str2_hash
end

def fifth_anagram?(str1, str2)
  str1_hash = Hash.new(0)
  str1.each_char {|char| str1_hash[char] += 1} 
  str1_hash.each_key do |key|
    return false if str2.count(key) != str1_hash[key]
  end
  true
end

p fifth_anagram?("gizmo", "sally")    #=> false
p fifth_anagram?("elvis", "lives")    #=> true