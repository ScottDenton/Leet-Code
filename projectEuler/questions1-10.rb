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

# p find_prime(10001)

# problem 8
big_num = 7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450

def find_big_product(num)
  arr = num.to_s.split('').map(&:to_i)
  i = 0
  the_biggest_product = 0
  while i < 1000
    product = arr[i...i+13].reduce(:*)
    if product > the_biggest_product
       the_biggest_product = product
     end
    i+=1
  end
  the_biggest_product
end

# puts find_big_product(big_num)

# problem 9
# Special Pythagorean triplet
  # There exists exactly one Pythagorean triplet for which a + b + c = 1000.

def find_triplet
  # define possible values for a, b and c
  # keep end values under 500(half total) to start to reduce calculations
  a_values = (1..500)
  b_values = (1..500)
  c_values = (1..500)
  a_final = 0
  b_final = 0
  c_final = 0
  a_values.each do|a|
    b_values.each do|b|
      c_values.each do |c|
        if (a + b + c == 1000) && a**2 + b**2 == c**2
           a_final = a
           b_final = b
           c_final = c
           break
         end
      end
    end
  end
  puts "a is #{a_final}, b is #{b_final}, c is #{c_final}"
  a_final * b_final * c_final
end

# puts find_triplet()

# problem 10
require 'prime'
def is_prime?(num)
  return true if num <=3 && num > 1
  if num % 2 == 0 || num % 3 ==0
    return false
  else
    (5..num/2).each do|n|
      if num % n == 0
        return false
      end
    end
  end
  return true
end

def sum_of_primes(num)
  # ***** super slow way ... just dont do it
  # (2..num).select{|n| is_prime?(n)}.reduce(:+)

  # ***** about 30 sec
  # primes = []
  # (2..num).each do |n|
  #   if Prime.prime?(n)
  #     primes << n
  #   end
  # end
  # primes.reduce(:+)

# Quickest way by far
   Prime.each(num).reduce(:+)
end

# puts is_prime?(1997)
p sum_of_primes(2000000)
