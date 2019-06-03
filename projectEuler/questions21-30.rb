# question 21
# find all the divisors for a num and sum them
def divisors(num)
  (1...num).select{|n| num % n ==0}.reduce(:+)
end

# find all the amicable pairs in a range
# 1. checks if number actually has divisors
#    divisors(num)
# 2. checks if number is equil to the sum of its divisors divisors
#    num == divisors(divisors(num))
# 3. check that a != b
#     num != divisors(num)
def amicable_numbers(max)
  (1...max).select do |num|
    divisors(num) && num == divisors(divisors(num)) &&  num != divisors(num)
  end
end

# Sum of the amicables together - not neccessary as an extra step but kept it easier to read
def sum_of_amicable(max)
  amicable_numbers(max).reduce(:+)
end

# p sum_of_amicable(10000)

# question 23
# check if num is abundant
def abundant_number?(num)
  num < (1...num).select{|n| num % n == 0}.reduce(:+)
end

# find all abundant numbers below given number
def abundant_below(num)
  (12...(num/2 +1)).select{|n| abundant_number?(n)}
end
# p abundant_below(100)

# check if the num can be made by summing to abundant numbers less than it
def sum_of_abundant?(num)
  array = abundant_below(num)
  !array.select{|n| array.include?(num -n) }.empty?
end

# p sum_of_abundant?(100)

def non_abundant_integers(max)
  (12..max).select{|n| !sum_of_abundant?(n)}
end

# p non_abundant_integers(100).reduce(:+)

# **** WORKS BUT IS SUPER SLOW

# QUESTION: 25
# 100 digit fib

# find 1000 digit number and set as upper limit
#  i is set as a counter / shows the current index
max  = 10 ** 999
a = 1
b = 1
i = 2

while b < max
  i += 1
  temp = a
  a = b
  b = a + temp
end

puts i
