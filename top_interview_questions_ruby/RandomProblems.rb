def subdomain_visits(cpdomains)
  hash =Hash.new(0)
  cpdomains.each do |domain|
    arr = domain.split(' ')
    hash[arr[1]] += arr[0].to_i

    split = arr[1].split('.')
    i = 1
    while i < split.length
        hash[split[i..-1].join('.')] += arr[0].to_i
        i +=1
    end
  end
  hash.map{|key, value| [value.to_s, key].join(' ')}
end

# pp subdomain_visits(["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"])


def roman_to_int(s)
  numerals = {1000 => "M", 900 => "CM", 500 => "D", 400 => "CD", 100 => "C", 90 => "XC", 50 => "L", 40 => "XL", 10 => "X", 9 => "IX", 5 => "V", 4 => "IV", 1 => "I"}

  answer = []
  arr = s.split("")
  i = 0
  while i < arr.length
    double = numerals.find{|k,v| arr[i..i+1].join("") == v}
    single = numerals.find{|k,v| arr[i] == v}
    if double
      answer.push(double[0])
      i+=2
    else
      answer.push(single[0])
      i+=1
    end
  end
  answer.reduce(:+)
end

# pp roman_to_int("MCMXCIV")


def title_to_number(s)
    alphabet = %w(0 A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
    answer = 0
    i = 0
    s.chars.reverse.each do |c|   #each with index would increase speed a bit instead of a counter
      answer += alphabet.index(c) * (26**i)
      i+=1
    end
    answer
end

# pp title_to_number("ZY")


class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

def sorted_array_to_bst(nums)
  return nil if nums.empty?
  mid = (nums.length / 2)
  node = TreeNode.new(nums[mid])
  node.left = sorted_array_to_bst(nums[0...mid]) if mid - 1 >= 0
  node.right = sorted_array_to_bst(nums[mid +1..-1]) if mid + 1 <= nums.length - 1
  node
end

pp sorted_array_to_bst([-10,-3,0,5,9])
