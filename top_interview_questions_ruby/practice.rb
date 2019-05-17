def removeDuplicates(arr, counter = 0)
  if counter >= arr.length
    return arr.length
  elsif arr[counter] == arr[counter + 1]
    arr.delete_at(counter)
    removeDuplicates(arr)
  else
    counter +=1
    removeDuplicates(arr, counter)
  end
end

arr = [1,2,2,3,3,3,4,5]

#  Intersection of Two Arrays II

def intersect(nums1, nums2)
  nums1Hash={}
  nums1.each{|n|
    if nums1Hash.include?(n)
      nums1Hash[n] +=1
    else
      nums1Hash[n] = 1
    end
  }
  output = []
  nums2.each {|n|
    if nums1Hash.include?(n)
      output << n
    end
  }
output
end
 # p intersect([1,2,2,1], [2,2])

 def plus_one(digits, i = -1)
   if digits[i] < 9
     digits[i] += 1
     return digits
   else
     digits[i] = 0
     digits.push(0) if i.abs == digits.length
     digits = plus_one(digits, i -=1)
   end
 end
 # p plus_one([9,9,9])

 def move_zeroes(nums)
    for i in nums
      nums.push(nums.delete_at(nums.index(i))) if i == 0
    end
end
# p move_zeroes([0,1,2,4,1,0,1])

def two_sum(nums, target)
  i = 0
  answer = []
  while i < nums.length
    num2 = target - nums[i]
    remaining = nums[i+1..-1]
    if remaining.include?(num2)
      answer.push(i)
      answer.push(nums.rindex(num2))
      return answer
    end
    i +=1
  end
end
 # p two_sum([3,3], 6)

# *********     VALID SUDOKU *********
def row_is_valid(arr)
  i = 0
  while i < arr.length
    if arr[i] != "." && arr[i+1..-1].include?(arr[i])
      return false
    else
      i +=1
    end
  end
  true
end

def check_all_rows(board)
  for row in board
    if !row_is_valid(row)
      return false
    end
  end
  return true
end

def check_all_columns(board)
  i = 0
  while i < board[1].length
    column = []
    board.each do |row|
      column.push(row[i])
    end
    if !row_is_valid(column)
      return false
    else
      i +=1
    end
  end
  return true
end

def check_all_boxes(board)
  i = 0
  j = 0
  while i < board.length && j < board.length
  box = board[i][j..j+2].concat(board[i+1][j..j+2]).concat(board[i+2][j..j+2])
    if row_is_valid(box) && i < 6
      i += 3
    elsif row_is_valid(box) && i == 6
      i = 0
      j += 3
    else
      return false
    end
  end
  return true
end

def is_valid_sudoku(board)
  return check_all_rows(board) && check_all_columns(board) && check_all_boxes(board)
end

p check_all_boxes([
  [".",".",".",".","5",".",".","1","."],
  [".","4",".","3",".",".",".",".","."],
  [".",".",".",".",".","3",".",".","1"],
  ["8",".",".",".",".",".",".","2","."],
  [".",".","2",".","7",".",".",".","."],
  [".","1","5",".",".",".",".",".","."],
  [".",".",".",".",".","2",".",".","."],
  [".","2",".","9",".",".",".",".","."],
  [".",".","4",".",".",".",".",".","."]])

# ***************  END OF SUDOKU

 
