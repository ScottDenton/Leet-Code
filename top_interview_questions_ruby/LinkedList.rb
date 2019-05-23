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


#
