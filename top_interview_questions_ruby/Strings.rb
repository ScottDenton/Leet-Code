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
# faster solution beat 91% for runtime
def first_uniq_char(s)
  hash = Hash.new(0)
  s.chars.each{|char| hash[char] += 1}
  hash.each {|key, value| return s.index(key) if value == 1}
  -1
end


p first_uniq_char("loveleetcode")
