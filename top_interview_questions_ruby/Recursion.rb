# ****      Recursively swap node pairs

def swap_pairs(head)
  # if there is no head return nil
    return nil unless head
    #create a new node to help with rearrangement
    new_head = ListNode.new(nil)
    #if there is no next, return head (ie its the end of the list)
    return head if !head.next
    # set the new node to the 2nd node in line
    new_head = head.next
    # set what was the head(soon to be second)'s next to point to same function, repeating process on next pair
    head.next = swap_pairs(new_head.next)
    #make the new head point to the original, pushing it to second place in line
    new_head.next = head
    #at the end return the new head
    new_head
end



# *************   Pascals Triangle

def generate(num_rows)
  triangle = []
  num_rows.times do |i|
    triangle.push([1]) if i == 0      # if its one of the first two add the ones accordingly
    triangle.push([1,1]) if i ==1

    if i > 1                          #if its more than two push an empty array
      triangle.push([])
      triangle[i].push(1)             #start it with a 1
      (1...i).each do |j|             # depending on the row number(each row length is equal to the row number)
        triangle[i].push(triangle[i-1][j-1] + triangle[i-1][j]) # add the items above together to find its total
      end
    triangle[i].push(1)               # push a 1 onto the end when your done with the row.
    end
  end
  triangle                            #return the triangle
end

# *********      PASCALS TRIANGLE II - recursive
def get_row(row_index, triangle = [], i = 0)
  return triangle[i-1]  if i == row_index +1
  triangle.push([1]) if i == 0
  triangle.push([1,1]) if i == 1
  if i > 1
    triangle[i] = [1]
    (1...i).each do |j|
      triangle[i].push(triangle[i-1][j-1] + triangle[i-1][j])
    end
    triangle[i].push(1)
  end
  get_row(row_index, triangle, i +1)
end
# p get_row(7)



# ********* REVERSE LINKED LIST
def reverse_list(head, previous = nil)
   return previous if head == nil

    next_node = head.next
    head.next = previous

    reverse_list(next_node, head )
end


#************   RECURSIVE FIBONACCI WITH MEMOIZATION

def fib(n, cache={0=>0, 1=>1, 2=>1})
    return cache[n] if cache[n]

    cache[n] = fib(n-1, cache) + fib(n-2, cache)
end

# Beat 100% for memory and just under 97% for speed


#**********      CLIMB STAIRS WITH MEMOIZATION

def climb_stairs(n, cache = { 1=>1, 2=>2, 3=>3})
    return cache[n] if cache[n]
    cache[n] = climb_stairs(n-1, cache) + climb_stairs(n-2, cache)
end

# ****    BONUS = PRINT STRING IN REVERSE RECURSIVELY

def reverse(str, n = str.length-1)
  return str if n == 0
  return reverse(str[1..n], n-1) + str[0]
end

# puts reverse("Hello World")


#**********  MERGE TWO SORTED LISTS
def merge_two_lists(l1, l2)
   return l1 if l2.nil?
   return l2 if l1.nil?

    if l1.val < l2.val
        l1.next = merge_two_lists(l1.next, l2)
        l1
    else
        l2.next = merge_two_lists(l1, l2.next)
        l2
    end
end
