# problem 1

def multiples_3_5(num)
  arr = []
  (0...num).each do |num|
    if num % 3 == 0 || num % 5 == 0
      arr << num
    end
  end
  arr.reduce(:+)
end

# puts multiples_3_5(10)
# puts multiples_3_5(1000)

# problem 2

# 1 1 2 3 5 8 13 21 34 55 89
def fib(n)
  return 1 if n <= 2
    fib(n-1) + fib( n-2)
end

def fibSequence
  arr =[]
  i = 1
  while fib(i) < 4000000
    if fib(i).even?
      arr << fib(i)
    end
    i+=1
  end
  arr.reduce(:+)
end

# puts fibSequence()


# problem 3
# first check if a number is prime
def prime(num)
  (2...num-1).each{|n| return false if num % n == 0 }
  true
end
# p prime(600851475143)

# finds primes numbers up to given number
def find_primes(num)
  arr = []
  i = 3
  while i < num
    arr << i if prime(i)
    i+=1
  end
  arr
end

#  finds numbers that can be divided by given num
def largest_factor(num)
  arr = find_primes(10000)
  arr.select{|n| num % n == 0}.last
end
# p largest_factor(600851475143)
# problem 4
# check if a number is a palindrome
def palindrome(num)
  arr = num.to_s.split('')
  arr == arr.reverse
end

def find_palindromes
  range = (100..999).to_a.reverse
  answer = 0
  for i in range
    for j in range
      n = i * j
      if palindrome(n) && n > answer
        answer = n
      end
    end
  end
  answer
end

# puts find_palindromes


# problem 5

def smallest_multiple
#   range = (1...20)
#   i = 300000000
#
#   while i > 380
#     if range.all? {|num| i % num.to_f == 0}
#       return i
#     end
#     i -= 1
#   end
#   false
# end

(1..10).reduce(:lcm)
end
# puts smallest_multiple()

# problem 6
def sum_of_squares(max)
  (1..max).map{|num| num * num}.reduce(:+)
end

def square_of_sums(max)
  (1..max).reduce(:+)**2
end

# puts square_of_sums(100) - sum_of_squares(100)

# problem 7
def find_prime(num)
  i = 2
  primes = []
  while primes.length < num
    if prime(i)
      primes << i
    end
    i+=1
  end
  return primes[-1]
end

p find_prime(10001)
# problem 8

# problem 9

# problem 10

# problem 11

# problem 12

# problem 13

# problem 14

# problem 15

# problem 16
