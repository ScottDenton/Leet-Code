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
# check if a number is prime
def prime(num)
  (2...num-1).each{|n| return false if num % n == 0 }
  true
end

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
p largest_factor(600851475143)
# problem 3
# problem 4
# problem 5
# problem 6
# problem 7
# problem 8
# problem 9
# problem 10
# problem 11
# problem 12
# problem 13
# problem 14
# problem 15
# problem 16
