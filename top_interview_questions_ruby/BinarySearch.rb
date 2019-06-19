# ******  NUMBER GUESSING GAME WITH BINARY SEARCH

def guess(num, min, max, count = 1)
  my_guess = (max + min) / 2
  if my_guess == num
    puts "Your number is #{my_guess} and it took me #{count} guesses"
  elsif  num > my_guess
    return guess(num, my_guess, max, count +1 )
  else
    return guess(num, min, my_guess, count +1)
  end
end

# puts guess(200, 0, 1000)


# *******       SEARCH IN ROTATED ARRAY

#  Start by declaring a class to hold the tree nodes, with a value and an index
class TreeNode
  attr_accessor :val, :left, :right, :index

  def initialize(val, index)
    @val = val
    @index = index
    @left = nil
    @right = nil
  end
end


#  basic method to insert a new item into a given tree
def insert_into_tree(root, new_value, index)
  if root.val == new_value
    return root
  elsif new_value < root.val
    if root.left
      insert_into_tree(root.left, new_value, index)
    else
      root.left = TreeNode.new(new_value, index )
    end
  else
    if root.right
      insert_into_tree(root.right, new_value, index)
    else
      root.right = TreeNode.new(new_value, index)
    end
  end
end

# Build the tree with the given array and the insert_into_tree function above
def build_tree(array)
  tree = TreeNode.new(array[0], 0)
  (1..array.length-1).each {|i|
    insert_into_tree(tree, array[i], i)
  }
  tree
end

# search the newly built tree, return the index when you find what you are looking for.
def find_index(array, target, root = build_tree(array))
  return root.index if target == root.val
  if target < root.val
    if root.left
      find_index(array, target, root.left)
    else
      -1
    end
  else target > root.val
    if root.right
      find_index(array, target, root.right)
    else
      -1
    end
  end
end

# pp find_index([4,5,6,7,0,1,2], 9)

# ************        FIND PEAK ELEMENT

def find_peak_element(nums)
   i = 0
    while i < (nums.length) - 1
        if nums[i] > nums[i+1]
            return i
        end
        i+=1
    end
    return (nums.length) -1
end

# pp find_peak_element([1,2,3,1])


# *******    FIND MINIMUM IN ROTATED SORTED ARRAY
def find_min(nums)
    min = 0
    max = (nums.length) -1
  while min < max
      mid = ((min + max) / 2)
      if nums[mid] > nums[max]
          min = mid +1
      else
          max = mid
      end
  end
    nums[max]
end

# pp find_min([2,1] )



def search_range(nums, target)
  min = 0
  max = (nums.length) -1
  answer = []
  return [0,0] if nums.length ==1 and target == nums[0]

  while min < max
    mid = ((min + max) /2)
    if nums[mid] < target
        min = mid +1
    elsif nums[mid] > target
        max = mid
    else
      i = 1
      until nums[mid -i] != target
        i +=1
      end
      answer.push(mid - i+1)
      j = 1
      until nums[mid +1] != target
        j +=1
      end
      answer.push(mid + j-1)
      return answer
    end
  end
  return [-1, -1]
end

# pp search_range([1], 1)

# FIND THE SUM OF ALL NUMBERS WITHIN A GIVEN RANGE FOR BINARY SEARCH TREE
def range_sum_bst(root, l, r)
    total = 0
    unless root.nil?
        total += range_sum_bst(root.right, l, r) if root.right
        total += range_sum_bst(root.left, l, r) if root.left
        total += root.val if root.val >= l && root.val <= r
    end
        total
end
