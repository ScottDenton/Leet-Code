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

puts find_big_product(big_num)

# problem 9

# problem 10

# problem 11

# problem 12

# problem 13

# problem 14

# problem 15

# problem 16
