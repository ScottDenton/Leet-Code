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

p sum_of_amicable(10000)
