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
