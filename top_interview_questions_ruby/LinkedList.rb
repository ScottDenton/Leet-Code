# ********      DELETE NODE IN A LINKED LIST **********


def delete_node(node)
  # sets the given nodes value to the value of the next item in line
  node.val = node.next.val
  # sets the given nodes 'next' to the value of the next in lines next value
  node.next = node.next.next
end

# *********     REMOVE nTH NODE FROM END OF LIST    *****************
def remove_nth_from_end(head, n)
# count the total amount of items in the list
  nextNode = head
  totalSize = 0
  while (nextNode != nil)
    nextNode = nextNode.next
    totalSize += 1
  end

# once count is complete nextNode is reset for next set of calculations
  nextNode = head
  currentNode = head
  i = 0

  while (nextNode != nil)
# only start moving through after the first item
    currentNode = currentNode.next if i > 1
    nextNode = nextNode.next
# if we are at the right spot - denoted by total size - n
    if totalSize - i == n
# check if n is the same as the total length, ie first item is being removed
      if i == 0
        head = head.next
      else
# otherwise set the previous node to point to the next and go around the current node
        currentNode.next = nextNode
      end
    end
    i += 1
  end
  head
end


# ********* REVERSE LINKED LIST *************
# def reverse_list(head)
#   if head.next == nil
#     break
#   end
#   if head.next.next == nil
#     head.next.next = head
#     head.next = nil
#   end
#   reverse_list(head.next)
# end

# using a stack
class ListNode
  attr_accessor :val, :next
  @@all = {}
  def initialize(val)
    @val = val
    @next = nil
    @@all[val] = self
  end

  def self.all
     @@all
  end
end

def reverse_list(head, stack=[])
   if head.next != nil
    stack.push(head.val)
    reverse_list(head.next, stack)
  else
    stack << head.val
  end
  (stack.length-1).times do
    ListNode.all[stack.pop].next = ListNode.all[stack[-1]]
  end
  ListNode.all[stack[0]].next = nil
  ListNode.all
end

l1 = ListNode.new(10)
l1.next = ListNode.new(6)
l1.next.next = ListNode.new(14)
# puts ListNode.all
# puts l1.next.next.val
puts ListNode.all[14].val
puts ListNode.all[14].next
p reverse_list(l1)
puts ListNode.all[14].val
puts ListNode.all[14].next.val

# find the last element and change its next to last-1
# repeat until last -1 is empty and set next to nil

#

# ************       BINARY TREE     ************

def max_depth(root)
    return 0 unless root
  left = max_depth(root.left)
  right = max_depth(root.right)

  [left, right].max + 1

end

# *******      VALIDATE BINDARY SEARCH TREE      ************
def is_valid_bst(root, min = -Float::INFINITY, max = Float::INFINITY)
    return true if root == nil
    if root.val <= min || root.val >= max
        return false
    else
        is_valid_bst(root.left, min, root.val) && is_valid_bst(root.right, root.val, max)
    end
end
