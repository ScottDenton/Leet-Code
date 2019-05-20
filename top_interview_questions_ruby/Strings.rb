# ****************      REVERSE STRING     ********************

def reverse_string(s)
  s.replace(s.reverse)
end

# p reverse_string(["h","e","l","l","o"])

# ****************     REVERSE INTEGER     ********************

def reverse(x)
  if x >= 0
      converted = x.to_s.reverse.to_i
      return converted <= 2147483648 ? converted : 0
  else
      converted = x.to_s.reverse.to_i * -1
      return converted >= -2147483648 ? converted : 0
  end
end
 # shortened version
def reverse(x)
    x >= 0 ? converted = x.to_s.reverse.to_i : converted = x.to_s.reverse.to_i * -1
    return converted.bit_length < 32 ? converted : 0
end
# p reverse(-123)

# ************   FIRST UNIQUE CHARACTER IN STRING  *************

# slow solution - beat 25% for runtime
def first_uniq_char(s)
  hash = {}
  for i in s.split('')
     hash.include?(i) ? hash[i] += 1 :hash[i] = 1
  end
  hash.each {|key, value| return s.index(key) if value == 1}
  -1
end

# faster solution - beat 91% for runtime
def first_uniq_char(s)
  hash = Hash.new(0)
  s.chars.each{|char| hash[char] += 1}
  hash.each {|key, value| return s.index(key) if value == 1}
  -1
end

# p first_uniq_char("loveleetcode")



# *****************    VALID ANAGRAM    **************************

# not very efficient but simple solution
def is_anagram(s, t)
   s.chars.sort == t.chars.sort
end

# p is_anagram("anagram", "nagaram")



# **************     VALID PALINDROME **************

def is_palindrome(s)
     s.downcase.gsub(/\W/,'') == s.downcase.gsub(/\W/,'').reverse
end

# p is_palindrome("A man, a plan, a canal: Panama")


# ********     STRING TO INTEGER (atoi) *****************

def my_atoi(str)
  num = str.to_i
    if num > 2147483647
      return 2147483647
    elsif num < -2147483648
        return -2147483648
    else
      return num
    end
end

#  regex mess that didnt work if there were more than one space at the start
# def my_atoi(str)
#   if str.match(/^(\s?[0-9]|\s?\+\d).*?$/)
#     num = str.gsub(/\+/,'')
#     num = num.match(/(\s?\d*)/)[0].to_i
#     if num > 2147483648
#       return 2147483648
#     else
#       return num
#     end
#   elsif str.match(/^(\s?[0-9]|\s?\-).*$/)
#     num = str.match(/(\s?-\d*)/)[0].to_i
#     if num < -2147483648
#       return -2147483648
#     else
#       return num
#     end
#   else
#     return 0
#   end
# end


p my_atoi("   +42 dsaf")
